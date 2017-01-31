//
//  Developer.h
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"

@interface Developer : Person

@property NSMutableArray *ableDevRole;
@property NSMutableArray *ableLanguage;

- (instancetype)initWithName:(NSString *)name
                     withAge:(NSUInteger)age
                  withHeight:(NSUInteger)height
                withBirthday:(NSUInteger)birthday
                 withCompany:(NSString *)company
              withCareerYear:(NSUInteger)careerYear;

- (void)coding;


@end
