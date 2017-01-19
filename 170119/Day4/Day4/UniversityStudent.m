//
//  UniversityStudent.m
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "UniversityStudent.h"

@implementation UniversityStudent

// @Override
- (void)eat {
    NSLog(@"여기는 UniversityStudent 클래스 : %@ 대학생이 먹습니다.", self.name);
    [super eat];
}

//// @Override
//- (void)talkTo:(Person *)person {
//    NSLog(@"%@ 대학생이 %@에게 말합니다.", self.name, person.name);
//    [super talkTo:person];
//}


// @Overload
- (void)talkTo:(Person *)person
     something:(NSString *)str {
    
    NSLog(@"여기는 UniversityStudent 클래스 : %@ 대학생이 %@에게 말합니다. \"%@\"", self.name, person.name, str);
    
    [super talkTo:person];  // 부모클래스의 - (void)talkTo:(Person *)person로 감
}


- (void)goMT {
    NSLog(@"MT간다!");
}

- (void)goMT:(NSString *) to {
    NSLog(@"%@로 MT간다!", to);
}


//- (void)goMT:(NSInteger) day {
//    NSLog(@"%ld일 MT간다!", day);
//}

@end
