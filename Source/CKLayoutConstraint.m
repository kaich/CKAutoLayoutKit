//
//  CKLayoutConstraint.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import "CKLayoutConstraint.h"

@implementation CKLayoutConstraint


+(instancetype)constraintWithItem:(id)view1 attribute:(CKLayoutAttribute)attr1 relatedBy:(CKLayoutRelation)relation toItem:(id)view2 attribute:(CKLayoutAttribute)attr2 multiplier:(float)multiplier constant:(float)c
{
    
    return [[CKLayoutConstraint alloc] initWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:c];
}



#pragma mark instance method 
-(instancetype)initWithItem:(id)view1 attribute:(CKLayoutAttribute)attr1 relatedBy:(CKLayoutRelation)relation toItem:(id)view2 attribute:(CKLayoutAttribute)attr2 multiplier:(float)multiplier constant:(float)c
{
    self =[super init];
    if(self)
    {
        _firstItem=view1;
        _firstAttribute=attr1;
        _relation=relation;
        _secondItem=view2;
        _secondAttribute=attr2;
        _multiplier=multiplier;
        _constant=c;
        _isActive=NO;
    }
    return self;
}

@end
