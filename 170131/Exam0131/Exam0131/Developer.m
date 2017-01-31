//
//  Developer.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (instancetype)init {
    self = [super init];
    
    self.job = @"Developer";
    self.ableDevRole = [[NSMutableArray alloc] init];
    self.ableLanguage = [[NSMutableArray alloc] init];
    
    return self;
}

- (instancetype)initWithName:(NSString *)name
                     withAge:(NSUInteger)age
                  withHeight:(NSUInteger)height
                withBirthday:(NSUInteger)birthday
                 withCompany:(NSString *)company
              withCareerYear:(NSUInteger)careerYear
{
    self = [super initWithName:name withAge:age withHeight:height withBirthday:birthday];
    
    self.job = @"Developer";
    self.ableDevRole = [[NSMutableArray alloc] init];
    self.ableLanguage = [[NSMutableArray alloc] init];

    self.company = company;
    self.careerYear = careerYear;
    
    return self;
}

- (void)coding {

    NSLog(@"%@의 %lu년차 %@ %@(이)가 %@로 코딩을 하고 있습니다.", self.company, self.careerYear, [self.ableDevRole objectAtIndex:0], self.name, [self.ableLanguage objectAtIndex:0]);

}

@end
