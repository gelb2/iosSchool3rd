//
//  Day15.h
//  Day15
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Day15 : NSObject

// 연습문제 - easy

// 1. 절대값 구하기
//  - 입력 : [self absoluteNum:124] // [self absoluteNum:-124]
//  - 결과 : 124                    // 124

+ (NSUInteger)absoluteNum:(NSInteger)num;



// 2. 무조건 양수결과 계산기 (덧셈 뺄셈만)
//  - [self calcuOP:@"+" num1:10 num2:3] >> 13
//  - [self calcuOP:@"-" num1:10 num2:3] >> 7
//  - [self calcuOP:@"-" num1:3 num2:10] >> 7

+ (NSUInteger)calcuOP:(NSString *)op num1:(NSInteger)num1 num2:(NSInteger)num2;



// 3. 반올림 문제 : 소수점 3째 자리에서 반올림 하는 함수 만들기
//  - 입력 : [self roundNum:3.134]    // [self roundNum:3.4552]
//  - 결과 : 3.13                     // 3.46

+ (CGFloat)roundNum:(CGFloat)num;



// 3+α. 반올림 문제 : 마지막 소수점 자리에서 반올림 하는 함수 만들기

+ (CGFloat)roundLastNum:(CGFloat)num;



// 4. 구구단 구현
+ (void)gogodan:(NSInteger)dan;


// 5. 배수 찾기 (lange와 배수를 받아 해당 lange안에 있는 배수를 모두 골라 출력하시오)
+ (void)findMultipleNum:(NSUInteger)num lange:(NSUInteger)lange;

// 6. 팩토리얼
+ (void)factorial:(NSUInteger)num;

@end
