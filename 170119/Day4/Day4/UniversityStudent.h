//
//  UniversityStudent.h
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Student.h"

@interface UniversityStudent : Student

@property NSUInteger idNumber;      // 여기선 은닉화 안함

@property NSString *major;

- (void)goMT;
- (void)goMT:(NSString *) to;
//- (void)goMT:(NSInteger) day;

- (void)talkTo:(Person *)person
     something:(NSString *)str;

@end
