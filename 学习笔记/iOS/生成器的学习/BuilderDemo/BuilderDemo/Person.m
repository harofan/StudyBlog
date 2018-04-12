//
//  Person.m
//  BuilderDemo
//
//  Created by 范杨 on 2018/4/12.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "Person.h"
#define FY_SAFE_BLOCK(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })
@implementation Person

- (instancetype)initWithBuilder:(PersonBuilder *)builder{
    if (self = [super init]) {
        //这里可以对数据做一些过滤以及线程安全的操作
        self.firstName = builder.firstName;
        self.lastName = builder.lastName;
        self.age = builder.age;
    }
    return self;
}

+ (instancetype)personWithBlock:(void (^)(PersonBuilder *))block{
    PersonBuilder *builder = [[PersonBuilder alloc] init];
    //外部对生成器进行设置
    FY_SAFE_BLOCK(block,builder);
    return [builder build];
}
@end
