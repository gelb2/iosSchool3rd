//
//  Person.m
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@implementation Person

- (void)checkAccount:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 %lu원 입니다.", self.name, bank.name, self.asset);
}


- (void)depositTo:(Bank *)bank Money:(NSUInteger)money {
    NSLog(@"%@가 %@은행에 %ld를 입금하였습니다.", self.name, bank.name, money);
    self.asset += money;
}

@end
