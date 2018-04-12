//
//  PersonBuilder.h
//  BuilderDemo
//
//  Created by 范杨 on 2018/4/12.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@interface PersonBuilder : NSObject

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger age;

- (Person *)build;
@end
