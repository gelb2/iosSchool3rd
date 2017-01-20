//
//  main.m
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Man.h"
#import "Woman.h"
#import "Bank.h"

int main(int argc, const char * argv[]) {
    
    // 1-5 남자와 여자, 은행의 객체를 각각 한개씩 생성하고 각 프로퍼티에 적절한 값을 입력해주세요.
    Man *man = [[Man alloc] init];
    man.name = @"최제헌";
    man.asset = 100000;
    
    Woman *woman = [[Woman alloc] init];
    woman.name = @"김연아";
    woman.asset = 100000000;
    
    Bank *bank = [[Bank alloc] init];
    bank.name = @"국민";
    bank.location = @"신사";
    
    
    // 1-6 남자가 은행에 700원을 입금하는 메소드를 여자는 은행에 500원을 입금하는 메소드를 호출해 보세요.
    [man depositTo:bank Money:700];
    [woman depositTo:bank Money:500];
    
    
    // 1-7 남자, 여자가 은행에 자신의 자산을 조회하는 메소드를 호출해 보세요.
    [man checkAccount:bank];
    [woman checkAccount:bank];
    
    
    // 1-8 은행이 제주도로 이전하는 메소드를 호출해 보세요.
    [bank addressTo:@"제주도"];
    
    
    // 1-9 남자가 여자에게 또는 여자가 남자에게 1000원을 이체하는 메소드를 호출해 보세요.
    [bank transferFrom:man To:woman Money:1000];
    [bank transferFrom:woman To:man Money:1000];
    
    return 0;
}
