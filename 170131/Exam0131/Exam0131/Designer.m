//
//  Designer.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Designer.h"

@implementation Designer

- (instancetype)init {
    self = [super init];

    self.job = @"Designer";
    self.ableDsnRole = [[NSMutableArray alloc] init];
    self.ableTool = [[NSMutableArray alloc] init];
    
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
    
    self.job = @"Designer";
    
    self.company = company;
    self.careerYear = careerYear;
    
    self.ableDsnRole = [[NSMutableArray alloc] init];
    self.ableTool = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)design {
    NSLog(@"%@의 %lu년차 %@ %@(이)가 %@(으)로 디자인을 하고 있습니다.", self.company, self.careerYear, [self.ableDsnRole objectAtIndex:0], self.name, [self.ableTool objectAtIndex:0]);
}

@end
