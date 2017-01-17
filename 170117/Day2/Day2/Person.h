//
//  Person.h
//  Day2
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject        // NSObject : 최상위 클래스 타입
                                    // NS -> Next Step : 잡스 회사 중 하나

/*
 @interface와 @end 사이에 프로퍼티 및 메서드를 정의합니다.
 프로퍼티 및 메서드명은 camelCase로 작성

    프로퍼티 : 객체가 가질 수 있는 특징, 상태 등의 값 (변수와 프로퍼티는 다르다.)
    @property <데이터 타입> <프로퍼티 이름>;

    메서드 : 객체가 수행할 수 있는 동작 또는 기능
    - (<반환 타입>)<메서드 이름>;
 
 */

@property id name;      // id : 최상위 데이터 타입
@property id gender;
@property id birthDay;
@property id age;
@property id height;
@property id bloodType;
@property id marriageState; // 기혼? 미혼?
@property id religion;
@property id race;      // 인종
@property id personIQ;
@property id country;
@property id idNumber;  //주민등록번호
@property id job;
@property id income;
@property id nickName;
@property id phoneNumber;
@property id e_mailAddress;
@property id hobby;

- (id)isAlive;      // 살아있나?
- (id)think;
- (id)walk;
- (id)eat;
- (id)drink;
- (id)talk;
- (id)study;
- (id)work;
- (id)rest;
- (id)sleep;
- (id)hangOut;      // 놀다.
- (id)love;
- (id)hate;

@end
