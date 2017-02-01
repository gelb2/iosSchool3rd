//
//  DDay.h
//  DDay
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDay : NSObject

// 1. 윤년 확인
//  : 윤년은 기본적으로 매 4년마다 돌아오나, 100으로 나눠떨어자는 해는 윤년이 아니며 또 그중 400으로 나눠 떨어지는 해는 윤년이다.
+ (BOOL)checkLeapYear:(NSUInteger)year;


// 2. 윤년을 활용해서 매월의 마지막 일 구하기
+ (NSUInteger)lastDayOfMonth:(NSUInteger)month
                        year:(NSUInteger)year;


// 3. d-day기능 만들기 시작날과 끝날을 받아서 두 날 사이의 d-day구하기
+ (NSInteger)firstDay:(NSString *)firstDay lastDay:(NSString *)lastDay;



@end
