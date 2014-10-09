//
//  UIView+Hierarchy.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CKLayoutConstraintLayout.h"

@interface UIView (Hierarchy)
@property(nonatomic,assign) float left;
@property(nonatomic,assign) float right;
@property(nonatomic,assign) float top;
@property(nonatomic,assign) float bottom;
@property(nonatomic,assign) float width;
@property(nonatomic,assign) float height;
@property(nonatomic,assign) float centerX;
@property(nonatomic,assign) float centerY;


-(BOOL) isSublingViewByView:(UIView*) deView;
@end
