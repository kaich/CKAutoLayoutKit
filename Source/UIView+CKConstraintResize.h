//
//  UIView+CKConstraintResize.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-10-8.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKLayoutConstraint.h"


#define ExcuteConstraintLayout(_constraint_) \
NSString *_firstpropertyName=[self propertyByAttribute:constraint.firstAttribute];\
float _firstValue =[self getConstraintValue:_constraint_];\
[_constraint_.firstItem setValue:FLOAT_TO_NUMBER(_firstValue) forKey:_firstpropertyName];


@interface UIView (CKConstraintResize)

-(float) getConstraintValue:(CKLayoutConstraint*) constraint;

-(NSDictionary*) attributeMapping;

-(NSString*) propertyByAttribute:(CKLayoutAttribute) attribute;


-(void) caculateVertical;
-(void) caculateHorizontal;

-(void) reCaculateCoordination;

@end
