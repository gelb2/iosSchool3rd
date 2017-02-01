//
//  Quiz.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

// switch 문제 : 월의 마지막날 구하기
+ (NSInteger)lastDayOfMonth:(NSInteger)month {
    //윤년 무시
    int day = 0;
    
    switch (month) {
        case 2:
            day = 28;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day = 30;
            break;
        default:            // 1, 3, 5, 7, 8, 10, 12 1~12까지만 쓸 경우임.
            day = 31;
    }
    NSLog(@"%ld월의 마지막날은 %d일입니다.", month, day);
    return day;
}


@end
