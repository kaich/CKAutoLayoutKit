//
//  UIView+CKConstraintResize.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-10-8.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import "UIView+CKConstraintResize.h"
#import "CKMacro.h"
#import "UIView+CKLayoutConstraintLayout.h"

@implementation UIView (CKConstraintResize)

-(NSDictionary*) attributeMapping
{
    
    return @{
             ENUM_TO_KEY(CKLayoutAttributeLeft) : @"left",
             ENUM_TO_KEY(CKLayoutAttributeRight) : @"right",
             ENUM_TO_KEY(CKLayoutAttributeTop) : @"top",
             ENUM_TO_KEY(CKLayoutAttributeBottom) : @"bottom",
             ENUM_TO_KEY(CKLayoutAttributeLeading) : @"left",
             ENUM_TO_KEY(CKLayoutAttributeTrailing) : @"right",
             ENUM_TO_KEY(CKLayoutAttributeWidth) : @"width",
             ENUM_TO_KEY(CKLayoutAttributeHeight) : @"height",
             ENUM_TO_KEY(CKLayoutAttributeCenterX) : @"centerX",
             ENUM_TO_KEY(CKLayoutAttributeCenterY) : @"centerY"
             };
}

-(NSString*) propertyByAttribute:(CKLayoutAttribute) attribute
{
    NSString * propertyName= [[self attributeMapping] objectForKey:ENUM_TO_KEY(attribute)];
    return propertyName;
}


-(float) getConstraintValue:(CKLayoutConstraint*) constraint
{
    
    UIView *second=constraint.secondItem;
    NSString *secondpropertyName=[self propertyByAttribute:constraint.secondAttribute];
    float result= [[second valueForKeyPath:secondpropertyName] floatValue] *constraint.multiplier + constraint.constant;
    return  result;
}




-(void) caculateByAttribute:(CKLayoutAttribute) attribute
{
    CKLayoutConstraint * constraint =[self.ck_constraintsDictionary objectForKey:ENUM_TO_KEY(attribute)];
    if(constraint)
    {
        ExcuteConstraintLayout(constraint);
    }
}


-(void) caculateVertical
{
    [self caculateByAttribute:CKLayoutAttributeBottom];
    [self caculateByAttribute:CKLayoutAttributeCenterY];
    [self caculateByAttribute:CKLayoutAttributeTop];
}

-(void) caculateHorizontal
{
    [self caculateByAttribute:CKLayoutAttributeLeft];
    [self caculateByAttribute:CKLayoutAttributeCenterX];
    [self caculateByAttribute:CKLayoutAttributeRight];
}


-(void) reCaculateCoordination
{
    [self caculateVertical];
    [self caculateHorizontal];
}

@end
