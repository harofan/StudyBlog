//
//  PersonBuilder.m
//  BuilderDemo
//
//  Created by 范杨 on 2018/4/12.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "PersonBuilder.h"
#import "Person.h"

@implementation PersonBuilder

- (Person *)build{
    return [[Person alloc] initWithBuilder:self];
}
@end
