//
//  DDay.m
//  DDay
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "DDay.h"

@implementation DDay

+ (BOOL)checkLeapYear:(NSUInteger)year {
    
    if ((year % 4) == 0 ) {
        if ((year % 400) == 0) {
            return YES;
        }
        else if ((year % 100) == 0) {
            return NO;
        }
        return YES;
    }
    return NO;
}


+ (NSUInteger)lastDayOfMonth:(NSUInteger)month year:(NSUInteger)year {
    switch (month) {
        case 2:
            if ([DDay checkLeapYear:year])      // 윤년이면 참
                return 29;
            return 28;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        default:        // 1, 3, 5, 7, 8 ,10, 12
            return 31;
    }
}


+ (NSInteger)firstDay:(NSString *)firstDay lastDay:(NSString *)lastDay {
    // 잘못입력한거 거의 무시함
    
    NSInteger sumDays = 0;
    NSArray *firstDayArr = [firstDay componentsSeparatedByString:@"/"];        // /을 기준으로 문자열 나눔 yyyy mm dd
    NSArray *lastDayArr = [lastDay componentsSeparatedByString:@"/"];        // /을 기준으로 문자열 나눔 yyyy mm dd
    
    NSInteger firstYY = [[firstDayArr objectAtIndex:0] intValue];
    NSInteger firstMM = [[firstDayArr objectAtIndex:1] intValue];
    NSInteger firstDD = [[firstDayArr objectAtIndex:2] intValue];

    NSInteger lastYY = [[lastDayArr objectAtIndex:0] intValue];
    NSInteger lastMM = [[lastDayArr objectAtIndex:1] intValue];
    NSInteger lastDD = [[lastDayArr objectAtIndex:2] intValue];
    
    NSUInteger yearGap = 0;
    NSUInteger monthGap = 0;
    
    
    if (firstYY >= lastYY) {
        if (firstMM >= lastMM) {
            if (firstDD >= lastDD) {
                return sumDays;     // 0
            }
            sumDays = lastDD - firstDD + 1;
            return sumDays;
        }
        sumDays = [DDay lastDayOfMonth:firstMM year:firstYY] - firstDD + 1;     // 첫달 남은 일자 계산
        sumDays += lastDD;      // 마지막달 남은 일자 추가
     
        monthGap = lastMM - firstMM - 1;
        for (int i = 1; i <= monthGap ; i++) {
            sumDays += [DDay lastDayOfMonth:firstMM + i year:firstYY];
        }
        return sumDays;
    }
    
    sumDays = [DDay lastDayOfMonth:firstMM year:firstYY] - firstDD + 1;     // 첫달 남은 일자 계산
    monthGap = 12 - firstMM;
    for (int i = 1; i <= monthGap ; i++) {
        sumDays += [DDay lastDayOfMonth:firstMM + i year:firstYY];
    }
    

    yearGap = lastYY - firstYY - 1;
    while(true) {
        if (yearGap >= 1) {
            if ([DDay checkLeapYear:firstYY + yearGap]){
                sumDays += 366;
            }
            sumDays += 365;
            yearGap--;
        } else {
            break;
        }
    }
    
    for (int i = 1; i < lastMM ; i++) {
        sumDays += [DDay lastDayOfMonth:i year:lastYY];
    }
    
    sumDays += lastDD;
    
    return sumDays;
}


@end
