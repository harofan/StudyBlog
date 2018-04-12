//
//  main.m
//  BuilderDemo
//
//  Created by 范杨 on 2018/4/12.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *personA = [Person personWithBlock:^(PersonBuilder *builder) {
            builder.firstName = @"明";
            builder.lastName = @"李";
            builder.age = 18;
        }];
        
        NSLog(@"姓:%@ 名:%@ 年龄:%ld",personA.lastName, personA.firstName, (long)personA.age);
    }
    return 0;
}
