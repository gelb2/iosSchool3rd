//
//  main.m
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniversityStudent.h"

int main(int argc, const char * argv[]) {
    
    Person *h1 = [Person new];
    Student *h2 = [Student new];
    UniversityStudent *h3 = [UniversityStudent new];
    
    h1.name = @"최제헌";
    h2.name = @"오정규";
    h3.name = @"이재연";
    
    
    
    // Override & Super Test
    NSLog(@"#1 Override & Super Test");
    
    [h1 eat];   // Person
    [h2 eat];   // Student -> Person
    [h3 eat];   // UnivStudent -> Student -> Person
    
    
    
    // Inheritance Test
    NSLog(@"#2 Inheritance Test");
    
    [h3 study];
    
    
    
    // Overload Test
    NSLog(@"#3 Overload Test");

    [h3 goMT];
    [h3 goMT:@"제주도"];
//    [h3 goMT:3];

    [h3 talkTo   :h3
        something: @"안녕"];

    
    
    // Inheritance & Overload Test
    NSLog(@"#4 Inheritance & Overload Test");
    
    [h3 talkTo:h3];     // Overload 했으나, 호출 형태가 부모클래스에 정의된 메소드 형태(헤더)임
    
    
    
    // Hidden Test
    NSLog(@"#5 Hidden Test");
    
//    h1.idNumber = 920921;     // 은닉화로 접근(set) 불가
    [h1 setIdNum:920921];
//    NSLog(@"ID Number : %lu", h1.idNumber);     // 은닉화로 접근(get) 불가
    [h1 getIdNum];
    
    
    
    // Inheritance & Hidden Test
    NSLog(@"#6 Inheritance & Hidden Test");

    [h2 setIdNum:901105];
    [h2 getIdNum];
    [h3 setIdNum:900521];
    [h3 getIdNum];
    
    
    
    // Inheritance & 속성 Override Test
    NSLog(@"#7 Inheritance & 속성 Override Test");
    
    h3.idNumber = 19900521;             // public하게 오버라이딩
    NSLog(@"이건 은닉화 안됨 ID Number : %lu", h3.idNumber);
    
    
    
    // readonly property Test (은닉화를 하는데 read만 가능하게 만든 것)
    NSLog(@"#8 readOnly property Test");
    
//    h3.grade = @"A+";     // readonly 프로퍼티 set 불가
    [h3 setterGrade:@"A+"];
    NSLog(@"%@의 Grade : %@", h3.name, h3.grade);
    


    

    return 0;
}
