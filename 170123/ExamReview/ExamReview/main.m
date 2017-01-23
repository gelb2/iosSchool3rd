//
//  main.m
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bank.h"
#import "Man.h"
#import "Woman.h"

int main(int argc, const char * argv[]) {
    
    Man *man = [[Man alloc] init];
    man.name = @"최제헌";
    man.asset = 100000;
    
    Woman *woman = [[Woman alloc] init];
    woman.name = @"김연아";
    woman.asset = 10000000000000;
    
    Bank *bank = [[Bank alloc] init];
    bank.name = @"KB국민";
    bank.location = @"신사동";
    
    
    [man depositTo:bank amount:700];
    [woman depositTo:bank amount:500];
    
    [man checkAccount:bank];
    [woman checkAccount:bank];
    
    [bank moveTo:@"제주도"];
    
    [bank transferTo:woman from:man amount:1000];
    
    return 0;
}
