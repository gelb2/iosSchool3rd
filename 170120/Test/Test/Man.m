//
//  Man.m
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Man.h"
#import "Bank.h"

@implementation Man

- (void)depositTo:(Bank *)bank Money:(NSUInteger)money {
    [super depositTo:bank Money:money];
    [self checkAccount:bank];
}


- (void)makeCardFrom:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 카드를 만들었습니다.", self.name, bank.name);
}

@end
