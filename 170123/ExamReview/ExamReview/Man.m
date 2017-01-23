//
//  Man.m
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Man.h"
//#import "Bank.h"

@implementation Man

- (void)depositTo:(Bank *)bank amount:(NSUInteger)money {
    [super depositTo:bank amount:money];
    [super checkAccount:bank];
}

- (void)makeCardFrom:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 카드를 만들었습니다.", self.name, bank.name);
}


@end
