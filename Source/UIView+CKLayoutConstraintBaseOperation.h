//
//  UIView+CKLayoutConstraintBaseOperation.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-29.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKLayoutConstraint.h"

@interface UIView (CKLayoutConstraintBaseOperation)

- (void)ck_addConstraint:(CKLayoutConstraint *)constraint;
- (void)ck_addConstraints:(NSArray *)constraints;
- (void)ck_removeConstraint:(CKLayoutConstraint *)constraint;
- (void)ck_removeConstraints:(NSArray *)constraints ;

@end
