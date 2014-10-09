//
//  UIView+Hierarchy.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import "UIView+Hierarchy.h"
#import "UIView+CKLayoutConstraintBaseOperation.h"

@implementation UIView (Hierarchy)
@dynamic left,right,top,bottom,width,height,centerX,centerY;

-(BOOL) isSublingViewByView:(UIView *)deView
{
    if(!self.superview)
        return  NO;
    
    for (UIView * emView in self.superview.subviews) {
        if(emView==deView)
        {
            return YES;
            break;
        }
    }
    
    return NO;
}


#pragma mark dynamic method
-(float) left
{
    return  self.frame.origin.x;
}

-(void) setLeft:(float)left
{
    CGRect rect = self.frame;
    rect.origin.x=left;
    self.frame=rect;
}


-(float) right
{
    return self.frame.origin.x+self.frame.size.width;
}


-(void) setRight:(float)right
{
    
    CGRect rect = self.frame;
    rect.origin.x+=right-(self.frame.origin.x +self.frame.size.width);
    self.frame=rect;
}


-(float) top
{
    return self.frame.origin.y;
}

-(void) setTop:(float)top
{
    CGRect rect = self.frame;
    rect.origin.y=top;
    self.frame=rect;
}


-(float) bottom
{
    return self.frame.origin.y+self.frame.size.height;
}

-(void) setBottom:(float)bottom
{
    CGRect rect = self.frame;
    rect.origin.y+=bottom-(self.frame.origin.y +self.frame.size.height);
    self.frame=rect;
}


-(float) width
{
    return  self.frame.size.width;
}

-(void) setWidth:(float)width
{
    CGRect rect = self.frame;
    rect.size.width=width;
    self.frame=rect;
}

-(float) height
{
    return self.frame.size.height;
}

-(void) setHeight:(float)height
{
    CGRect rect = self.frame;
    rect.size.height=height;
    self.frame=rect;
}

-(float) centerX
{
    return self.center.x;
}

-(void) setCenterX:(float)centerX
{
    CGRect rect = self.frame;
    rect.origin.x+=centerX-self.frame.size.width/2;
    self.frame=rect;
}


-(float) centerY
{
    return self.center.y;
}

-(void) setCenterY:(float)centerY
{
    CGRect rect = self.frame;
    rect.origin.y+=centerY-self.frame.size.height/2;
    self.frame=rect;
}

@end
