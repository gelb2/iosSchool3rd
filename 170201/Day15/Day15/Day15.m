//
//  Day15.m
//  Day15
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Day15.h"

@implementation Day15


// 연습문제 - easy
// 1. 절대값 구하기
+ (NSUInteger)absoluteNum:(NSInteger)num {
    if (num < 0) {
        return num * -1;
    }
    return num;
}

// 2. 무조건 양수결과 계산기 (덧셈 뺄셈만)
+ (NSUInteger)calcuOP:(NSString *)op num1:(NSInteger)num1 num2:(NSInteger)num2 {
    if ([op isEqualToString:@"+"]) {
        return num1 + num2;
    }
    else {      // 뺄셈
        if (num1 >= num2)
            return num1 - num2;
        else
            return num2 - num1;
    }
}



// 3. 반올림 문제 : 소수점 3째 자리에서 반올림 하는 함수 만들기
+ (CGFloat)roundNum:(CGFloat)num {
//    int intNum = (int) ((num + 0.0051) * 100);      // x.xx9999 방지용 1
    int intNum = (int) (num * 100 + 0.5);

    return (float)intNum / 100;
}

// 3+α. 반올림 문제 : 마지막 소수점 자리에서 반올림 하는 함수 만들기
+ (CGFloat)roundLastNum:(CGFloat)num {
    NSString *strNum = [NSString stringWithFormat:@"%f", num];
    NSArray *arrNum = [strNum componentsSeparatedByString:@"."];        // .을 기준으로 문자열 나눔
    
    NSUInteger numLength = [arrNum[1] length];
    
    for (numLength-- ; ; numLength--) {
        if([arrNum[1] characterAtIndex:numLength] != '0') {
            
            CGFloat multiplyNum = pow(10, numLength);
            
//            NSLog(@"( %lf + %lf ) * %lf = %lf", num , (0.5 / multiplyNum), multiplyNum, (num + (0.5 / multiplyNum)) * multiplyNum);
//            NSLog(@"-> %d", (int)((num + (0.5 / multiplyNum)) * multiplyNum));
            
//            NSInteger intNum = (NSInteger) ((num + (0.51 / multiplyNum)) * multiplyNum);              // x.xx9999 방지용 1 추가
            NSInteger intNum = (NSInteger) (num * multiplyNum + 0.5);
            return ((CGFloat)intNum) / multiplyNum;
        }
    }
    
    return num;     // 소숫점 아래 숫자 없음 : 정수일때 그냥 반환
}


// 4. 구구단 구현
+ (void)gogodan:(NSInteger)dan;
{
    NSInteger count = 1;
    while (count < 10) {
        NSLog(@"%lu x %lu = %lu", dan, count, dan*count);
        count++;
    }
    
//    for (NSInteger count = 1 ; count < 10 ; count++) {
//        NSLog(@"%lu x %lu = %lu", dan, count, dan*count);
//    }
}


// 5. 배수 찾기 (lange와 배수를 받아 해당 lange안에 있는 배수를 모두 골라 출력하시오)

+ (void)findMultipleNum:(NSUInteger)num lange:(NSUInteger)lange {
    int maxCnt = (int)lange/num;
    NSString *numbers = [[NSString alloc] init];
    
    int index=1;
    while(index <= maxCnt) {
        numbers = [numbers stringByAppendingFormat:@"%ld ", num*index];
        index++;
    }
    NSLog(@"%@, %d개", numbers, maxCnt);
}

// 6. 팩토리얼
+ (void)factorial:(NSUInteger)num {
    NSUInteger resultValue = 1;
    NSString * formula= [[NSString alloc] initWithFormat:@"1"];

    NSUInteger i = 2;
    while (i <= num) {
        resultValue *= i;
        formula = [formula stringByAppendingFormat:@" x %ld", i];
        i++;
    }
    NSLog(@"%lu! = %@ = %lu", num, formula, resultValue);
}




@end
