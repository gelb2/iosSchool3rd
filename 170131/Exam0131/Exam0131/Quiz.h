//
//  Quiz.h
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property NSInteger month;


// switch 문제 : 월의 마지막날 구하기
+ (NSInteger)lastDayOfMonth:(NSInteger)month;



@end
