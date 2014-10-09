//
//  UIView+CKLayoutConstraint.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKLayoutConstraint.h"

@interface UIView (CKLayoutConstraintLayout)
@property(nonatomic,strong) NSArray * ck_constraints;
@property(nonatomic,strong) NSArray * ck_childrenConstraints;
@property(nonatomic,strong) NSDictionary * ck_constraintsDictionary;
@property(nonatomic,strong) NSArray * ck_flexibleWidthConstraints;
@property(nonatomic,strong) NSArray * ck_flexibleHeightConstraints;

@property(nonatomic,weak) id  widthMarkItem;
@property(nonatomic,weak) id  heightMarkItem;
@property(nonatomic,assign) float fixedWidth;
@property(nonatomic,assign) float fixedHeight;
@property(nonatomic,assign) float widthMarkScale;
@property(nonatomic,assign) float heightMarkScale;
@property(nonatomic,assign) float sblingWidthScaleSum;
@property(nonatomic,assign) float sblingHeightScaleSum;

@property(nonatomic,assign) CGSize oldSize;

-(BOOL) isFlexibleWidth;
-(BOOL) isFlexibleHeight;
@end
