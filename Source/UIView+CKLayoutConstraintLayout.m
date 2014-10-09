//
//  UIView+CKLayoutConstraint.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//  view1.attr1 <relation> view2.attr2 * multiplier + constant

#import "UIView+CKLayoutConstraintLayout.h"
#import <objc/runtime.h>
#import "UIView+Hierarchy.h"
#import "UIView+CKConstraintResize.h"
#import "CKMacro.h"


static char constraints_key;
static char chidrenConstraints_key;
static char constraints_dictionary_key;
static char flexibleWidthConstraints_key;
static char flexibleHeightConstraints_key;
static char widthMarkItem_key;
static char heightMarkItem_key;
static char fixedWidth_key;
static char fixedHeight_key;
static char widthMarkSacle_key;
static char heightMarkSacle_key;
static char sblingWidthMarkSacleSum_key;
static char sblingHeightMarkSacleSum_key;
static char oldSize_key;


@implementation UIView (CKLayoutConstraintLayout)
@dynamic ck_constraints, ck_constraintsDictionary, ck_flexibleHeightConstraints,ck_flexibleWidthConstraints,heightMarkItem,widthMarkItem,fixedHeight,fixedWidth,widthMarkScale,heightMarkScale,sblingHeightScaleSum,sblingWidthScaleSum,oldSize,ck_childrenConstraints;



-(BOOL) isFlexibleWidth
{
    return  [self.ck_constraintsDictionary objectForKey:ENUM_TO_KEY(CKLayoutAttributeWidth)];

}

-(BOOL) isFlexibleHeight
{
    return  [self.ck_constraintsDictionary objectForKey:ENUM_TO_KEY(CKLayoutAttributeHeight)];
}

-(BOOL) isDirectionChanged
{
    return !CGSizeEqualToSize(self.oldSize, self.frame.size);
}

-(BOOL) isNeedReLayout:(CKLayoutConstraint *) constraint
{
    return [self isDirectionChanged] || !constraint.active;
}


#pragma  mark -dynamic method
-(void) setCk_constraints:(NSArray *)ck_constraints
{
    objc_setAssociatedObject(self, &constraints_key, ck_constraints, OBJC_ASSOCIATION_RETAIN);
    
    [self ck_activeConstraint];
}

-(NSArray*) ck_constraints
{
    return  objc_getAssociatedObject(self, &constraints_key);
}

-(void) setCk_childrenConstraints:(NSArray *)ck_childrenConstraints
{
    objc_setAssociatedObject(self, &chidrenConstraints_key, ck_childrenConstraints, OBJC_ASSOCIATION_RETAIN);
}

-(NSArray*) ck_childrenConstraints
{
    return  objc_getAssociatedObject(self, &chidrenConstraints_key);
}

-(void) setCk_constraintsDictionary:(NSDictionary *)ck_constraintsDictionary
{
    objc_setAssociatedObject(self, &constraints_dictionary_key, ck_constraintsDictionary, OBJC_ASSOCIATION_RETAIN);

}

-(NSDictionary*) ck_constraintsDictionary
{
    return  objc_getAssociatedObject(self, &constraints_dictionary_key);
}

-(void) setCk_flexibleWidthConstraints:(NSArray *)ck_flexibleWidthConstraints
{
    objc_setAssociatedObject(self, &flexibleWidthConstraints_key, ck_flexibleWidthConstraints, OBJC_ASSOCIATION_RETAIN);
}

-(NSArray*) ck_flexibleWidthConstraints
{
    return  objc_getAssociatedObject(self, &flexibleWidthConstraints_key);
}


-(void) setCk_flexibleHeightConstraints:(NSArray *)ck_flexibleHeightConstraints
{
    objc_setAssociatedObject(self, &flexibleHeightConstraints_key, ck_flexibleHeightConstraints, OBJC_ASSOCIATION_RETAIN);
}

-(NSArray*) ck_flexibleHeightConstraints
{
    return  objc_getAssociatedObject(self, &flexibleHeightConstraints_key);
}

-(void) setHeightMarkItem:(id)heightMarkItem
{
    objc_setAssociatedObject(self, &heightMarkItem_key ,heightMarkItem, OBJC_ASSOCIATION_ASSIGN);
}

-(id) heightMarkItem
{
    return  objc_getAssociatedObject(self, &heightMarkItem_key);
}

-(void) setWidthMarkItem:(id)widthMarkItem
{
    objc_setAssociatedObject(self, &widthMarkItem_key , widthMarkItem, OBJC_ASSOCIATION_ASSIGN);
}

-(id) widthMarkItem
{
    return  objc_getAssociatedObject(self, &widthMarkItem_key);
}


-(void) setFixedHeight:(float)fixedHeight
{
    objc_setAssociatedObject(self, &fixedHeight_key , [NSNumber numberWithFloat:fixedHeight], OBJC_ASSOCIATION_RETAIN);
}

-(float) fixedHeight
{
    return  [objc_getAssociatedObject(self, &fixedHeight_key) floatValue];
}

-(void) setFixedWidth:(float)fixedWidth
{
    objc_setAssociatedObject(self, &fixedWidth_key , [NSNumber numberWithFloat:fixedWidth], OBJC_ASSOCIATION_RETAIN);
}

-(float) fixedWidth
{
    return  [objc_getAssociatedObject(self, &fixedWidth_key) floatValue];
}

-(void) setWidthMarkScale:(float)widthMarkScale
{
    objc_setAssociatedObject(self, &widthMarkSacle_key , [NSNumber numberWithFloat:widthMarkScale], OBJC_ASSOCIATION_RETAIN);
}

-(float) widthMarkScale
{
    return  [objc_getAssociatedObject(self, &widthMarkSacle_key) floatValue];
}

-(void) setHeightMarkScale:(float)heightMarkScale
{
    objc_setAssociatedObject(self, &heightMarkSacle_key , [NSNumber numberWithFloat:heightMarkScale], OBJC_ASSOCIATION_RETAIN);
}

-(float) heightMarkScale
{
    return  [objc_getAssociatedObject(self, &heightMarkSacle_key) floatValue];
}


-(void) setSblingWidthScaleSum:(float)sblingWidthScaleSum
{
    objc_setAssociatedObject(self, &sblingWidthMarkSacleSum_key , [NSNumber numberWithFloat:sblingWidthScaleSum], OBJC_ASSOCIATION_RETAIN);
}

-(float) sblingWidthScaleSum
{
    return  [objc_getAssociatedObject(self, &sblingWidthMarkSacleSum_key) floatValue];
}

-(void) setSblingHeightScaleSum:(float)sblingHeightScaleSum
{
    objc_setAssociatedObject(self, &sblingHeightMarkSacleSum_key , [NSNumber numberWithFloat:sblingHeightScaleSum], OBJC_ASSOCIATION_RETAIN);
}

-(float) sblingHeightScaleSum
{
    return  [objc_getAssociatedObject(self, &sblingHeightMarkSacleSum_key) floatValue];
}

-(void) setOldSize:(CGSize)oldSize
{
    objc_setAssociatedObject(self, &oldSize_key , [NSValue valueWithCGSize:oldSize], OBJC_ASSOCIATION_RETAIN);
}

-(CGSize) oldSize
{
    return  [objc_getAssociatedObject(self, &oldSize_key) CGSizeValue];
}

#pragma mark - layout


-(void) ck_layoutConstraints
{
    if(self.ck_childrenConstraints && [self isDirectionChanged])
    {
        for (CKLayoutConstraint * emConstraint in self.ck_childrenConstraints) {
            if([emConstraint.secondItem isSublingViewByView:emConstraint.firstItem])
            {
                [self ck_layoutSbliingConstraint:emConstraint widthMarkItem:nil heightMarkItem:nil];
            }
            else if(emConstraint.secondItem==self || emConstraint.secondItem==nil)
            {
                [self ck_layoutSuperConstraint:emConstraint];
            }
        }
        
        [self setOldSize:self.frame.size];

    }
}


-(void) ck_layoutSbliingConstraint:(CKLayoutConstraint*) constraint  widthMarkItem:(id) widthMark  heightMarkItem:(id) heightMark
{
    UIView * firstView=constraint.firstItem;
    if(constraint.secondItem==firstView.superview)
    {
        [self ck_layoutSuperConstraint:constraint];
    }
    else
    {
        UIView * associateView=constraint.secondItem;
        NSArray * associateConstraints=associateView.ck_constraints;

        
        id widthMarkItem=widthMark;
        id heightMarkItem=heightMark;
       
        if([self isNeedReLayout:constraint])
        {
            if(constraint.firstAttribute==CKLayoutAttributeWidth && constraint.secondItem!=nil)
            {
                NSMutableArray * flexibleConstaint=nil;
                if(self.ck_flexibleWidthConstraints.count>0)
                {
                    flexibleConstaint=[NSMutableArray arrayWithArray:self.ck_flexibleWidthConstraints];
                }
                else
                {
                    flexibleConstaint=[NSMutableArray array];
                }
                [flexibleConstaint addObject:constraint];
                self.ck_flexibleWidthConstraints=flexibleConstaint;
                
                
                UIView * first= constraint.firstItem;
                UIView * second =constraint.secondItem;
                UIView * markView=nil;
                
                if(!widthMarkItem)
                {
                    widthMarkItem=first;
                    second.widthMarkItem=first;
                    first.widthMarkScale=1;
                    second.widthMarkScale=(1/constraint.multiplier)*first.widthMarkScale;
                    first.sblingWidthScaleSum+=1 + second.widthMarkScale;
                    markView=first;
                }
                else
                {
                    first.widthMarkScale=constraint.multiplier*second.widthMarkScale;
                    markView=widthMarkItem;
                    markView.sblingWidthScaleSum+=first.widthMarkScale;
                }
        
                first.widthMarkItem=widthMarkItem;
                
                markView.fixedWidth+=constraint.constant;
                
                
                if([self isNeedReLayout:constraint] && associateConstraints.count >0)
                {
                    for (CKLayoutConstraint * emConstraint in associateConstraints) {
                        [self ck_layoutSbliingConstraint:emConstraint widthMarkItem:widthMarkItem heightMarkItem:heightMarkItem];
                    }
                }
                
            }
            else if(constraint.firstAttribute==CKLayoutAttributeHeight && constraint.secondItem!=nil)
            {
                NSMutableArray * flexibleConstaint=nil;
                if(self.ck_flexibleHeightConstraints.count>0)
                {
                    flexibleConstaint=[NSMutableArray arrayWithArray:self.ck_flexibleHeightConstraints];
                }
                else
                {
                    flexibleConstaint=[NSMutableArray array];
                }
                [flexibleConstaint addObject:constraint];
                self.ck_flexibleHeightConstraints=flexibleConstaint;
                
                UIView * first= constraint.firstItem;
                UIView * second =constraint.secondItem;
                UIView * markView=nil;
                
                
                if(!heightMarkItem)
                {
                    heightMarkItem=first;
                    second.heightMarkItem=first;
                    first.heightMarkScale=1;
                    second.heightMarkScale=(1/constraint.multiplier)*first.heightMarkScale;
                    first.sblingHeightScaleSum+=1 + second.heightMarkScale;
                    markView=first;
                }
                else
                {
                    first.heightMarkScale=constraint.multiplier*second.heightMarkScale;
                    markView=first;
                    markView.sblingHeightScaleSum+=first.heightMarkScale;
                }
                
                first.heightMarkItem=heightMarkItem;
                
                markView.fixedHeight+=constraint.constant;
                
                
                if([self isNeedReLayout:constraint] && associateConstraints.count >0)
                {
                    for (CKLayoutConstraint * emConstraint in associateConstraints) {
                        [self ck_layoutSbliingConstraint:emConstraint widthMarkItem:widthMarkItem heightMarkItem:heightMarkItem];
                    }
                }
                
            }
            else
            {
                if([self isNeedReLayout:constraint] && associateConstraints.count >0)
                {
                    for (CKLayoutConstraint * emConstraint in associateConstraints) {
                        [self ck_layoutSbliingConstraint:emConstraint widthMarkItem:widthMarkItem heightMarkItem:heightMarkItem];
                    }
                }
                
                ExcuteConstraintLayout(constraint);
                [self caculateFixedSblingRelation:constraint];
                constraint.active=YES;
            }
        }
        

        
        UIView * markView=firstView.widthMarkItem;
        float markWidth=(self.width -markView.fixedWidth)/markView.sblingWidthScaleSum;
        for(CKLayoutConstraint * emFlexibleConstraint in self.ck_flexibleWidthConstraints) {

            UIView * first=emFlexibleConstraint.firstItem;
            UIView * second=emFlexibleConstraint.secondItem;
           
            if (!second.isFlexibleWidth) {
                [self ck_layoutSuperConstraint:emFlexibleConstraint];
            }
            else
            {
                if (first.widthMarkItem==first) {
                    first.width=markWidth;
                    second.width=second.widthMarkScale*markWidth+emFlexibleConstraint.constant;
                }
                else
                {
                    first.width=first.widthMarkScale*markWidth+emFlexibleConstraint.constant;
                }
                [second caculateHorizontal];
                [first caculateHorizontal];
            }
            
        }
        
        markView=firstView.heightMarkItem;
        float markHeight=(self.height -markView.fixedHeight)/markView.sblingHeightScaleSum;
        for (CKLayoutConstraint * emFlexibleConstraint in self.ck_flexibleHeightConstraints) {
            UIView * first=emFlexibleConstraint.firstItem;
            UIView * second=emFlexibleConstraint.secondItem;
            
            
            if (!second.isFlexibleHeight) {
                [self ck_layoutSuperConstraint:emFlexibleConstraint];
            }
            else
            {
                if (second.heightMarkItem==second) {
                    second.height=markHeight;
                }
                
                first.height=second.heightMarkScale*markHeight+emFlexibleConstraint.constant;
                [second caculateVertical];
                [first caculateVertical];
            }
            
            
        }
        
        markView.fixedHeight=0;
        markView.fixedWidth=0;
        markView.sblingHeightScaleSum=0;
        markView.sblingWidthScaleSum=0;
        self.ck_flexibleWidthConstraints=nil;
    }
}

-(void) ck_layoutSuperConstraint:(CKLayoutConstraint*) constraint
{
    if([self isNeedReLayout:constraint])
    {
        ExcuteConstraintLayout(constraint);
        [self caculateFixedOnSuperRelation:constraint];
        constraint.active=YES;
    }
}


-(void) caculateFixedSblingRelation:(CKLayoutConstraint*) constraint
{
    
    CKLayoutAttribute  firstAttribute=constraint.firstAttribute;
    UIView * first=constraint.firstItem;
    UIView * markView=nil;
    if(firstAttribute==CKLayoutAttributeTop || firstAttribute==CKLayoutAttributeBottom)
    {
        markView=first.heightMarkItem;
        markView.fixedHeight+=constraint.constant;
    }
    else if(firstAttribute==CKLayoutAttributeLeft || firstAttribute==CKLayoutAttributeRight)
    {
        markView=first.widthMarkItem;
        markView.fixedWidth+=constraint.constant;
    }
}


-(void) caculateFixedOnSuperRelation:(CKLayoutConstraint*) constraint
{
    UIView * first=constraint.firstItem;
    UIView * markView=nil;
    if(constraint.firstAttribute==CKLayoutAttributeBottom )
    {
        markView=first.heightMarkItem;
        markView.fixedHeight+=first.superview.height-first.bottom;
    }
    else if(constraint.firstAttribute==CKLayoutAttributeTop)
    {
        markView=first.heightMarkItem;
        markView.fixedHeight+=first.top;
    }
    else if(constraint.firstAttribute==CKLayoutAttributeLeft)
    {
        markView=first.widthMarkItem;
        markView.fixedWidth+=first.left;
    }
    else if(constraint.firstAttribute==CKLayoutAttributeRight)
    {
        markView=first.widthMarkItem;
        markView.fixedWidth+=first.superview.width-first.right;
    }
}


-(void) layoutSubviewsStoreMethod
{
    NSAssert(YES, @"can not run layoutSubviewsSourceMethod");
}


-(void) layoutSubviewsReplcament
{
    [self ck_layoutConstraints];
    if([self respondsToSelector:@selector(layoutSubviewsStoreMethod)])
    {
        [self layoutSubviewsStoreMethod];
    }
}



BOOL class_ownReplaceMethod(Class objectClass,SEL sourceSelector, SEL replaceSeletor, SEL storeSelector) {

    Method sourceMethod = class_getInstanceMethod(objectClass,sourceSelector);
    Method replaceMethod =class_getInstanceMethod(objectClass,replaceSeletor);
    Method storeMethod =class_getInstanceMethod(objectClass, storeSelector);
    
    if (sourceSelector && replaceSeletor) {
        IMP replaceIMP=method_getImplementation(replaceMethod);
        IMP sourceIMP =method_getImplementation(sourceMethod);
        IMP storeIMP=method_getImplementation(storeMethod);
        method_setImplementation(storeMethod, sourceIMP);
        method_setImplementation(sourceMethod, replaceIMP);
        method_setImplementation(replaceMethod, storeIMP);
        return  YES;
    }
    
    return NO;
}


-(void) ck_activeConstraint
{
    static BOOL isChanged=NO;
    if(!isChanged)
    {
        class_ownReplaceMethod([self class], @selector(layoutSubviews), @selector(layoutSubviewsReplcament),@selector(layoutSubviewsStoreMethod));
        isChanged=YES;
    }
    
}


@end