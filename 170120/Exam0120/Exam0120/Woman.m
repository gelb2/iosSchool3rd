//
//  Woman.m
//  Exam0120
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Woman.h"
#import "Bank.h"

@implementation Woman

- (void)updateBankbook:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 통장정리를 하였습니다.", self.name, bank.name);
}

@end
