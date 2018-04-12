//
//  Person.h
//  BuilderDemo
//
//  Created by 范杨 on 2018/4/12.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonBuilder.h"

@interface Person : NSObject

//这里可以对属性进行一些设置,例如只读等等
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger age;

+ (instancetype)personWithBlock:(void (^)(PersonBuilder *))block;
- (instancetype)initWithBuilder:(PersonBuilder *)builder;

@end
