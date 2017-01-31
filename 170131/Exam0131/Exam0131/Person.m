//
//  Person.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
                     withAge:(NSUInteger)age
                  withHeight:(NSUInteger)height
                withBirthday:(NSUInteger)birthday
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.age = age;
        self.height = height;
        self.birthday = birthday;
    }
    
    return self;
}

- (void)setterJob:(NSString *)job
 withAnnualSalary:(NSUInteger)annualSalary
{
    self.job = job;
    self.annualSalary = annualSalary;
}

- (bool)isBirthdayToday:(NSUInteger)today {
    
    if(self.birthday%10000 == today%10000)
        return true;
    return false;
}

- (void)printAll {
    NSLog(@"%@, %lu, %lucm, %lu, %@, %@, 연봉%lu", self.name, self.age, self.height, self.birthday, self.address, self.job, self.annualSalary);
}


+ (void)printAll:(Person *)person {
    NSLog(@"%@, %lu, %lucm, %lu, %@, %@, 연봉%lu", person.name, person.age, person.height, person.birthday, person.address, person.job, person.annualSalary);
}

@end
