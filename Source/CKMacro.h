//
//  CKMacro.h
//  CKAutoLayoutKit
//
//  Created by mac on 14-10-8.
//  Copyright (c) 2014年 kaicheng. All rights reserved.
//


#define ENUM_TO_KEY(_enum_value_) [NSNumber numberWithInt:_enum_value_]

#define FLOAT_TO_NUMBER(_f_) [NSNumber numberWithFloat:_f_]

#define SET_END(_bool_) objc_setAssociatedObject(self, &isSettile_key, BOO_TO_NUMBER(_bool_), OBJC_ASSOCIATION_ASSIGN);

#define GET_END [objc_getAssociatedObject(self, &isSettile_key) boolValue]

#define BOO_TO_NUMBER(_bool_) [NSNumber numberWithBool:_bool_]
