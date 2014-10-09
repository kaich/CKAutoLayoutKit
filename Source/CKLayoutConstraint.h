//
//  CKLayoutConstraint.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-9-28.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//

#import <Foundation/NSObject.h>

@class NSArray, NSDictionary;


typedef NS_ENUM(NSInteger, CKLayoutRelation) {
    CKLayoutRelationLessThanOrEqual = -1,
    CKLayoutRelationEqual = 0,
    CKLayoutRelationGreaterThanOrEqual = 1,
};

typedef NS_ENUM(NSInteger, CKLayoutAttribute) {
    CKLayoutAttributeLeft = 1,
    CKLayoutAttributeRight,
    CKLayoutAttributeTop,
    CKLayoutAttributeBottom,
    CKLayoutAttributeLeading,
    CKLayoutAttributeTrailing,
    CKLayoutAttributeWidth,
    CKLayoutAttributeHeight,
    CKLayoutAttributeCenterX,
    CKLayoutAttributeCenterY
};



typedef float CKLayoutPriority;
static const CKLayoutPriority CKLayoutPriorityRequired  = 1000; // A required constraint.  Do not exceed this.
static const CKLayoutPriority CKLayoutPriorityDefaultHigh  = 750; // This is the priority level with which a button resists compressing its content.
static const CKLayoutPriority CKLayoutPriorityDefaultLow  = 250; // This is the priority level at which a button hugs its contents horizontally.
static const CKLayoutPriority CKLayoutPriorityFittingSizeLevel  = 50; // When you send -[UIView systemLayoutSizeFittingSize:], the size fitting most closely to the target size (the argument) is computed.  UILayoutPriorityFittingSizeLevel is the priority level with which the view wants to conform to the target size in that computation.  It's quite low.  It is generally not appropriate to make a constraint at exactly this priority.  You want to be higher or lower.

@interface CKLayoutConstraint : NSObject
{
@private
    id _container;
    id _firstItem;
    id _secondItem;
    float _constant;
    CKLayoutPriority _priority;
    BOOL _isActive;
}


/* Create constraints explicitly.  Constraints are of the form "view1.attr1 = view2.attr2 * multiplier + constant"
 If your equation does not have a second view and attribute, use nil and CKLayoutAttributeNotAnAttribute.
 */
+(instancetype)constraintWithItem:(id)view1 attribute:(CKLayoutAttribute)attr1 relatedBy:(CKLayoutRelation)relation toItem:(id)view2 attribute:(CKLayoutAttribute)attr2 multiplier:(float)multiplier constant:(float)c;

/* If a constraint's priority level is less than UILayoutPriorityRequired, then it is optional.  Higher priority constraints are met before lower priority constraints.
 Constraint satisfaction is not all or nothing.  If a constraint 'a == b' is optional, that means we will attempt to minimize 'abs(a-b)'.
 This property may only be modified as part of initial set up.  An exception will be thrown if it is set after a constraint has been added to a view.
 */
@property CKLayoutPriority priority;


/* accessors
 firstItem.firstAttribute {==,<=,>=} secondItem.secondAttribute * multiplier + constant
 */
@property (readonly,strong) id firstItem;
@property (readonly) CKLayoutAttribute firstAttribute;
@property (readonly) CKLayoutRelation relation;
@property (readonly,strong) id secondItem;
@property (readonly) CKLayoutAttribute secondAttribute;
@property (readonly) float multiplier;

/* Unlike the other properties, the constant may be modified after constraint creation.  Setting the constant on an existing constraint performs much better than removing the constraint and adding a new one that's just like the old but for having a new constant.
 */
@property float constant;

@property(nonatomic,assign) BOOL active;


@end

@interface CKLayoutConstraint (NSIdentifier)
/* For ease in debugging, name a constraint by setting its identifier, which will be printed in the constraint's description.
 Identifiers starting with UI and NS are reserved by the system.
 */
@property (copy) NSString *identifier ;

@end

