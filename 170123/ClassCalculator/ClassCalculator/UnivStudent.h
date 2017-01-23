//
//  Student.h
//  Day6
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnivStudent : NSObject

@property NSString *name;
@property NSString *studentIdNum;   // 학번

@property CGFloat gpa;   // 평점
@property CGFloat sum;   // 총점
@property NSUInteger sumCredit; // 총 이수학점

@property NSString *class1Name;
@property NSUInteger class1Credit;
@property NSString *class1Grade;

@property NSString *class2Name;
@property NSUInteger class2Credit;
@property NSString *class2Grade;

@property NSString *class3Name;
@property NSUInteger class3Credit;
@property NSString *class3Grade;

@property NSString *class4Name;
@property NSUInteger class4Credit;
@property NSString *class4Grade;

- (instancetype)initName:(NSString *)name;

- (void)classInsertNum:(NSUInteger)num
                  Name:(NSString *)name
                 credit:(NSUInteger)credit
                  grade:(NSString *)grade;


- (void)classCalculator;


@end
