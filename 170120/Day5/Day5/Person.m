//
//  Person.m
//  Day5
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"


@implementation Person

- (instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    self.name = name;

    return self;
}

- (instancetype)initWithName:(NSString *)name
                         Age:(NSInteger)age {
    self = [self initWithName:name];
    self.age = age;
    
    return self;
}


- (instancetype)initWithName:(NSString *)name
                         Age:(NSInteger) age
                       IDNum:(NSUInteger)idNum {
    
    self = [self initWithName:name Age:age];
    self.idNumber = idNum;

    return self;
}



@end
