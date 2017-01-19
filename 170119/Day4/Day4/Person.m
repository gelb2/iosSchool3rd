//
//  Person.m
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"



// m파일에 interface 카테고리화해서 작성 후
// 은닉화할 속성들 넣음

@interface Person () // 같은 클래스 내에서 카테고리 사용하므로 비어서 둠

@property NSUInteger idNumber;

@end



@implementation Person

- (void)eat {
    NSLog(@"여기는 Person 클래스 : %@ 사람이 먹습니다.", self.name);
}

- (void)talkTo:(Person *)person {
    NSLog(@"여기는 Person 클래스 : %@ 사람이 %@에게 말합니다.", self.name, person.name);
}

- (void)setIdNum:(NSUInteger)idNum {
    self.idNumber = idNum;
}

- (void)getIdNum {
    NSLog(@"%@의 ID Number : %lu", self.name, self.idNumber);
}

@end
