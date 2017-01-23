//
//  Student.m
//  Day6
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//
//  링크드리스트 넘나 필요한 것..
//

#import "UnivStudent.h"

@implementation UnivStudent

- (instancetype)initName:(NSString *)name {
    
    self = [super init];
    self.name = name;
    
    self.class4Grade = nil;
    self.class4Credit = 0;
    
    return self;
}


- (void)classInsertNum:(NSUInteger)num
                  Name:(NSString *)name
                credit:(NSUInteger)credit
                 grade:(NSString *)grade {

    if(num == 1) {
        self.class1Name = name;
        self.class1Credit = credit;
        self.class1Grade = grade;
    } else if(num == 2) {
        self.class2Name = name;
        self.class2Credit = credit;
        self.class2Grade = grade;
    } else if(num == 3) {
        self.class3Name = name;
        self.class3Credit = credit;
        self.class3Grade = grade;
    } else {
        self.class4Name = name;
        self.class4Credit = credit;
        self.class4Grade = grade;
    }
}


- (void)classCalculator {
    //init
    self.sum = 0;
    self.sumCredit = 0;
    
    //class1
    self.sumCredit += self.class1Credit;
    
    if(![self.class1Grade compare:@"A+"]) {         // NSString compare 메소드 -> 같을때 : 0, 다를때 : -1
        self.sum += 4.5 * self.class1Credit;
    } else if(![self.class1Grade compare:@"A"]) {
        self.sum += 4 * self.class1Credit;
    } else if(![self.class1Grade compare:@"B+"]) {
        self.sum += 3.5 * self.class1Credit;
    } else if(![self.class1Grade compare:@"B"]) {
        self.sum += 3 * self.class1Credit;
    } else if(![self.class1Grade compare:@"C+"]) {
        self.sum += 2.5 * self.class1Credit;
    } else if(![self.class1Grade compare:@"C"]) {
        self.sum += 2 * self.class1Credit;
    } else if(![self.class1Grade compare:@"D+"]) {
        self.sum += 1.5 * self.class1Credit;
    } else if(![self.class1Grade compare:@"D"]) {
        self.sum += 1 * self.class1Credit;
    } // F는 sum에 더할필요 없음
    
//    NSLog(@"class1 %.1lf, %ld", self.sum, self.sumCredit);

    
    //class2
    self.sumCredit += self.class2Credit;

    if(![self.class2Grade compare:@"A+"]) {
        self.sum += 4.5 * self.class2Credit;
    } else if(![self.class2Grade compare:@"A"]) {
        self.sum += 4 * self.class2Credit;
    } else if(![self.class2Grade compare:@"B+"]) {
        self.sum += 3.5 * self.class2Credit;
    } else if(![self.class2Grade compare:@"B"]) {
        self.sum += 3 * self.class2Credit;
    } else if(![self.class2Grade compare:@"C+"]) {
        self.sum += 2.5 * self.class2Credit;
    } else if(![self.class2Grade compare:@"C"]) {
        self.sum += 2 * self.class2Credit;
    } else if(![self.class2Grade compare:@"D+"]) {
        self.sum += 1.5 * self.class2Credit;
    } else if(![self.class2Grade compare:@"D"]) {
        self.sum += 1 * self.class2Credit;
    } // F는 sum에 더할필요 없음

//    NSLog(@"class2 %.1lf, %ld", self.sum, self.sumCredit);

    
    //class3
    self.sumCredit += self.class3Credit;
    
    if(![self.class3Grade compare:@"A+"]) {
        self.sum += 4.5 * self.class3Credit;
    } else if(![self.class3Grade compare:@"A"]) {
        self.sum += 4 * self.class3Credit;
    } else if(![self.class3Grade compare:@"B+"]) {
        self.sum += 3.5 * self.class3Credit;
    } else if(![self.class3Grade compare:@"B"]) {
        self.sum += 3 * self.class3Credit;
    } else if(![self.class3Grade compare:@"C+"]) {
        self.sum += 2.5 * self.class3Credit;
    } else if(![self.class3Grade compare:@"C"]) {
        self.sum += 2 * self.class3Credit;
    } else if(![self.class3Grade compare:@"D+"]) {
        self.sum += 1.5 * self.class3Credit;
    } else if(![self.class3Grade compare:@"D"]) {
        self.sum += 1 * self.class3Credit;
    } // F는 sum에 더할필요 없음
    
//    NSLog(@"class3 %.1lf, %ld", self.sum, self.sumCredit);

    
    //class4
    self.sumCredit += self.class4Credit;
    
    if(![self.class4Grade compare:@"A+"]) {
        self.sum += 4.5 * self.class4Credit;
    } else if(![self.class4Grade compare:@"A"]) {
        self.sum += 4 * self.class4Credit;
    } else if(![self.class4Grade compare:@"B+"]) {
        self.sum += 3.5 * self.class4Credit;
    } else if(![self.class4Grade compare:@"B"]) {
        self.sum += 3 * self.class4Credit;
    } else if(![self.class4Grade compare:@"C+"]) {
        self.sum += 2.5 * self.class4Credit;
    } else if(![self.class4Grade compare:@"C"]) {
        self.sum += 2 * self.class4Credit;
    } else if(![self.class4Grade compare:@"D+"]) {
        self.sum += 1.5 * self.class4Credit;
    } else if(![self.class4Grade compare:@"D"]) {
        self.sum += 1 * self.class4Credit;
    } // F는 sum에 더할필요 없음
    
//    NSLog(@"class4 %.1lf, %ld", self.sum, self.sumCredit);

    
    self.gpa = self.sum/self.sumCredit;
    NSLog(@"%@의 총 이수학점은 %ld이고 평점은 %.2lf입니다.", self.name, self.sumCredit, self.gpa);
}



@end
