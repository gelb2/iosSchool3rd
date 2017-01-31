//
//  Person.h
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSUInteger age;
@property NSUInteger height;
@property NSUInteger birthday;      // ex. 920921 yymmdd
@property NSString *job;
@property NSUInteger annualSalary;  // 연봉
@property NSString *address;

@property NSString *company;
@property NSUInteger careerYear;

- (instancetype)initWithName:(NSString *)name
                     withAge:(NSUInteger)age
                  withHeight:(NSUInteger)height
                withBirthday:(NSUInteger)birthday;

- (void)setterJob:(NSString *)job
 withAnnualSalary:(NSUInteger)annualSalary;

- (bool)isBirthdayToday:(NSUInteger)today;

- (void)printAll;

+ (void)printAll:(Person *)person;

@end
