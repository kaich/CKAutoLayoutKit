//
//  UIView+CKLayoutConstraintBaseOperation.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-29.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import "UIView+CKLayoutConstraintBaseOperation.h"
#import "UIView+CKLayoutConstraintLayout.h"
#import "CKMacro.h"


@implementation UIView (CKLayoutConstraintBaseOperation)

- (void)ck_addConstraint:(CKLayoutConstraint *)constraint
{
    NSMutableArray * constraints=nil;
    if(self.ck_childrenConstraints)
    {
        constraints =[self.ck_childrenConstraints mutableCopy];
    }
    else
    {
        constraints =[NSMutableArray array];
    }
    
    [constraints addObject:constraint];
    self.ck_childrenConstraints=constraints;
    
    
    NSMutableDictionary * constraintsDic=nil;
    if(self.ck_constraintsDictionary)
    {
        constraintsDic =[self.ck_constraintsDictionary mutableCopy];
    }
    else
    {
        constraintsDic =[NSMutableDictionary dictionary];
    }
    
    [constraintsDic setObject:constraint forKey:ENUM_TO_KEY(constraint.firstAttribute)];
    self.ck_constraintsDictionary =constraintsDic;
    
    
    UIView * first =constraint.firstItem;
    NSMutableArray * mainConstraints=nil;
    if(first.ck_constraints)
    {
        mainConstraints =[first.ck_constraints mutableCopy];
    }
    else
    {
        mainConstraints =[NSMutableArray array];
    }
    [mainConstraints addObject:constraint];
    first.ck_constraints =mainConstraints;
}


- (void)ck_addConstraints:(NSArray *)constraints
{
    for (CKLayoutConstraint * emConstraint in constraints) {
        [self ck_addConstraint:emConstraint];
    }
}


- (void)ck_removeConstraint:(CKLayoutConstraint *)constraint
{
    
}


- (void)ck_removeConstraints:(NSArray *)constraints
{
    
}


@end
