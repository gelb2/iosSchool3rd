//
//  Student.m
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Student.h"


@interface Student ()

@property NSString *grade;      // 내부에서는 쓸 수 있게함

@end


@implementation Student

// @Override
- (void)eat {
    NSLog(@"여기는 Student 클래스 : %@ 학생이 먹습니다.", self.name);
    [super eat];
}

- (void)talkTo:(Person *)person {
    NSLog(@"여기는 Student 클래스 : %@ 학생이 %@에게 말합니다.", self.name, person.name);
}



- (void)study {
    NSLog(@"여기는 Student 클래스 : 공부를 합니다.");
}

- (void)setterGrade:(NSString *) grd {

//    1. setGrade라고 지으면 프로퍼티 생성할 때
//    자동 생성되는 메서드 이름과 같아 오버라이딩 한 것

//    2. self.grade는 setter 함수를 호출하는 것
    
//    3. setter 함수 위에서 오버라이딩 했으니 무한 재귀 빠지게 됨;;;

    
    self.grade = grd;
    //_grade = grd;         // 프로퍼티 내부 _grade 변수
}

@end
