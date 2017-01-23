//
//  Person.m
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@implementation Person

- (void)depositTo:(Bank *)bank amount:(NSUInteger)money {
    self.asset += money;        // 사실 bank에 asset이 들어가 있는게 맞음..
    NSLog(@"%@가 %@은행에 %ld를 입금하였습니다.", self.name, bank.name, money);
}

- (void)checkAccount:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 %ld원 입니다.", self.name, bank.name, self.asset);
}

@end
