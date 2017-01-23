//
//  main.m
//  ClassCalculator
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//  학점 계산기 만들기 (ClassCalculator)
//


#import <Foundation/Foundation.h>
#import "UnivStudent.h"

int main(int argc, const char * argv[]) {
    
    UnivStudent *student1 = [[UnivStudent alloc] initName:(@"최제헌")];
    
    [student1 classInsertNum:1 Name:@"미적1" credit:3 grade:@"A"];
    [student1 classInsertNum:2 Name:@"공수A" credit:3 grade:@"B+"];
    [student1 classInsertNum:3 Name:@"객프" credit:3 grade:@"A"];
    [student1 classInsertNum:4 Name:@"컴구" credit:3 grade:@"A+"];
    
    
    UnivStudent *student2 = [[UnivStudent alloc] initName:(@"김연아")];
    
    [student2 classInsertNum:1 Name:@"피겨" credit:19 grade:@"A+"];
    [student2 classInsertNum:2 Name:@"올림픽" credit:19 grade:@"A+"];
    [student2 classInsertNum:3 Name:@"객프" credit:3 grade:@"B+"];
    
    [student1 classCalculator];
    [student2 classCalculator];
    
    return 0;
}
