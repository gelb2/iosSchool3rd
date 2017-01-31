//
//  main.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//  사실 Exam이 아닌 Review용 플젝임.
//

#import <Foundation/Foundation.h>
#import "Developer.h"
#import "Designer.h"
#import "Quiz.h"
#import "Toolbox.h"


int main(int argc, const char * argv[]) {
    
    Person *h1 = [[Person alloc] initWithName:@"최제헌" withAge:26 withHeight:177 withBirthday:920921];

//    Person *h1 = [[Person alloc] init];
//    h1.name = @"최재헌";
//    h1.age = 26;
//    h1.height = 177;
//    h1.birthday = 920921;
    
    h1.address = @"경기도 광명시 소하로 162";
    
    [h1 setterJob:@"대학생" withAnnualSalary:0];
    
    [Person printAll:h1];   // class method
    [h1 printAll];          // instance method
    
    
    if ([h1 isBirthdayToday:170131])
        NSLog(@"%@(이)가 오늘 생일입니다! 축하해주세요!",h1.name);
    else
        NSLog(@"오늘은 %@의 생일이 아닙니다.",h1.name);
    
//    if ([h1 isBirthdayToday:170921])
//        NSLog(@"%@(이)가 오늘 생일입니다! 축하해주세요!",h1.name);
//    else
//        NSLog(@"오늘은 %@의 생일이 아닙니다.",h1.name);


    
    Developer *dev1 = [[Developer alloc] initWithName:@"이두희" withAge:35 withHeight:176 withBirthday:830716 withCompany:@"멋사" withCareerYear:10];
    [dev1.ableDevRole addObject:@"서버 개발자"];
    [dev1.ableLanguage addObject:@"ruby"];
    [dev1.ableLanguage addObject:@"C"];
    
    [dev1 coding];
    
   
    
    Designer *dsn1 = [[Designer alloc] initWithName:@"김아무개" withAge:30 withHeight:212 withBirthday:320131 withCompany:@"삼성" withCareerYear:120];
    [dsn1.ableDsnRole addObject:@"캘라그라퍼"];
    [dsn1.ableTool addObject:@"붓"];
    
    [dsn1 design];
    
    
    // switch 문제 : 월의 마지막날 구하기
    Quiz *q1 = [[Quiz alloc] init];
    
    for (int i=1 ; i<13 ; i++) {
        [q1 lastDayOfMonth:i];
    }
    
    
    // Class Method 문제 : 디벨로퍼인가?
    [Toolbox isDevloper:dev1];
    [Toolbox isDevloper:dsn1];
    
    
    return 0;
}
