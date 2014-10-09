//
//  ViewController.m
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CKLayoutConstraintBaseOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * first =[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    first.backgroundColor=[UIColor greenColor];
    [first setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:first];
    
    UIView * second =[[UIView alloc] initWithFrame:CGRectMake(10, 20, 120, 120)];
    second.backgroundColor=[UIColor redColor];
    [second setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:second];
    
    UIView * third=[[UIView alloc] initWithFrame:CGRectMake(10, 20, 130, 130)];
    third.backgroundColor=[UIColor blueColor];
    [third setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:third];
    
//测试代码块 1. 测试首先将 CKLayout 替换成 CKLayout  然后改动 addConstraints 加 ck_ 即可 ，预期两者效果相同.
//    CKLayoutConstraint * c1=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeTop multiplier:1 constant:20];
//    CKLayoutConstraint * c2=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeLeft multiplier:1 constant:20];
//    CKLayoutConstraint * c3=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    CKLayoutConstraint * c4=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    
//    CKLayoutConstraint * c5=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeBottom relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeBottom multiplier:1 constant:-20];
//    CKLayoutConstraint * c6=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeRight relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeRight multiplier:1 constant:-20];
//    CKLayoutConstraint * c7=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    CKLayoutConstraint * c8=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    
//    CKLayoutConstraint * c9=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeBottom multiplier:1 constant:50];
//    CKLayoutConstraint * c10=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeRight multiplier:1 constant:20];
//    CKLayoutConstraint * c11=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeWidth multiplier:0.5 constant:0];
//    CKLayoutConstraint * c12=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    [self.view addConstraints:@[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12]];
    
//测试代码块2. 测试成功
//    CKLayoutConstraint * c1=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeTop multiplier:1 constant:20];
//    CKLayoutConstraint * c2=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeLeft multiplier:1 constant:20];
//    CKLayoutConstraint * c3=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeWidth multiplier:0.5 constant:0];
//    CKLayoutConstraint * c4=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//
//    CKLayoutConstraint * c5=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeBottom relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeBottom multiplier:1 constant:-20];
//    CKLayoutConstraint * c6=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeRight relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeRight multiplier:1 constant:-20];
//    CKLayoutConstraint * c7=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    CKLayoutConstraint * c8=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//
//    CKLayoutConstraint * c9=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeBottom multiplier:1 constant:50];
//    CKLayoutConstraint * c10=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeRight multiplier:1 constant:20];
//    CKLayoutConstraint * c11=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeWidth multiplier:0.5 constant:0];
//    CKLayoutConstraint * c12=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
//    [self.view ck_addConstraints:@[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12]];
    
//测试代码块3. 测试成功
    CKLayoutConstraint * c1=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeTop multiplier:1 constant:20];
    CKLayoutConstraint * c2=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeLeft multiplier:1 constant:20];
    CKLayoutConstraint * c3=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationGreaterThanOrEqual toItem:nil attribute:0 multiplier:0 constant:100];
    CKLayoutConstraint * c4=[CKLayoutConstraint constraintWithItem:first attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
    
    CKLayoutConstraint * c5=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeBottom relatedBy:CKLayoutRelationEqual toItem:self.view attribute:CKLayoutAttributeBottom multiplier:1 constant:-20];
    CKLayoutConstraint * c6=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeRight relatedBy:CKLayoutRelationEqual toItem:third attribute:CKLayoutAttributeRight multiplier:1 constant:-20];
    CKLayoutConstraint * c7=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
    CKLayoutConstraint * c8=[CKLayoutConstraint constraintWithItem:second attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
    
    CKLayoutConstraint * c9=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeTop relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeBottom multiplier:1 constant:50];
    CKLayoutConstraint * c10=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeLeft relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeRight multiplier:1 constant:20];
    CKLayoutConstraint * c11=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeWidth relatedBy:CKLayoutRelationEqual toItem:first attribute:CKLayoutAttributeWidth multiplier:0.5 constant:0];
    CKLayoutConstraint * c12=[CKLayoutConstraint constraintWithItem:third attribute:CKLayoutAttributeHeight relatedBy:CKLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100];
    [self.view ck_addConstraints:@[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
