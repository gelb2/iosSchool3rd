//
//  main.m
//  Day15
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

//  반복문 학습 (while, for)
//  문제 풀기

#import <Foundation/Foundation.h>
#import "Day15.h"

int main(int argc, const char * argv[]) {

    // 연습문제
    // 1. 절대값 구하기
    NSLog(@"#1. 절대값 구하기");
    NSLog(@" 124 -> %lu", [Day15 absoluteNum:124]);
    NSLog(@"-124 -> %lu", [Day15 absoluteNum:-124]);
    
    
    // 2. 무조건 양수결과 계산기 (덧셈 뺄셈만)
    NSLog(@"#2. 무조건 양수결과 계산기 (덧셈 뺄셈만)");
    NSLog(@"10 + 3 -> %lu",[Day15 calcuOP:@"+" num1:10 num2:3]);
    NSLog(@"10 - 3 -> %lu",[Day15 calcuOP:@"-" num1:10 num2:3]);
    NSLog(@"10 - 3 -> %lu",[Day15 calcuOP:@"-" num1:3 num2:10]);
    
    
    // 3. 반올림 문제 : 소수점 3째 자리에서 반올림 하는 함수 만들기
    NSLog(@"#3. 반올림 문제 : 소수점 3째 자리에서 반올림 하는 함수 만들기");
    NSLog(@"3.134 -> %.4lf", [Day15 roundNum:3.134]);
    NSLog(@"3.135 -> %.4lf", [Day15 roundNum:3.135]);
    NSLog(@"3.136 -> %.4lf", [Day15 roundNum:3.136]);
    NSLog(@"3.4552 -> %.4lf", [Day15 roundNum:3.4552]);
    
    
    // 3+α. 반올림 문제
    NSLog(@"#3+α. 반올림 문제");
    NSLog(@"3.134 -> %lf", [Day15 roundLastNum:3.134]);
    NSLog(@"3.135 -> %lf", [Day15 roundLastNum:3.135]);
    NSLog(@"3.133215 -> %lf", [Day15 roundLastNum:3.133215]);
    
    
    
    // 4. 구구단 구현
    NSLog(@"#4. 구구단 구현");
    [Day15 gogodan:3];
    
    
    // 5. 배수 찾기 (lange와 배수를 받아 해당 lange안에 있는 배수를 모두 골라 출력하시오)
    NSLog(@"#5. 배수 찾기");
    [Day15 findMultipleNum:3 lange:12];
    [Day15 findMultipleNum:3 lange:11];
    [Day15 findMultipleNum:2 lange:15];
    
    
    // 6. 팩토리얼
    NSLog(@"#6. 팩토리얼");
    [Day15 factorial:5];
    [Day15 factorial:6];
    
    return 0;
}
