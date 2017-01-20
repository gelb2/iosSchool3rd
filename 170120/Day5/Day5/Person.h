//
//  Person.h
//  Day5
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSUInteger age;
@property NSUInteger idNumber;


- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name
                         Age:(NSInteger)age;

- (instancetype)initWithName:(NSString *)name
                         Age:(NSInteger)age
                       IDNum:(NSUInteger)idNum;


@end
