//
//  ViewController.m
//  ProtobufObjc
//
//  Created by Link on 2019/2/26.
//  Copyright © 2019 Link. All rights reserved.
//

#import "ViewController.h"
#import "Person.pbobjc.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    person.name = @"张三";
    person.age = 18;
    
    //序列化
    NSData *personData = person.data;
    
    //反序列化
    Person *person1 = [Person parseFromData:personData error:nil];
    NSLog(@"姓名:%@, 年龄:%d", person1.name, person1.age);
    //姓名:张三, 年龄:18
}


@end
