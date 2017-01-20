//
//  Bank.m
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Bank.h"
#import "Person.h"

@implementation Bank

- (void)transferFrom:(Person *)from To:(Person *)to Money:(NSUInteger)money {
    NSLog(@"%@가 %@에게 %lu를 이체하였습니다.", from.name, to.name, money);
    from.asset -= money;
    to.asset += money;
}


- (void)addressTo:(NSString *)to {
    NSLog(@"%@가 %@에서 %@로 이전하였습니다.", self.name, self.location, to);
    self.location = to;
}

@end
