//
//  Student.h
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property (readonly) NSString *grade;

- (void)study;
//- (void)setGrade:(NSString *) grd;        // readonly한 후, 이렇게 프로퍼티 setter를 만들어주면 write까지 가능하게 되어버림;;
- (void)setterGrade:(NSString *) grd;

@end
