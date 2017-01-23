//
//  Person.h
//  Game
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property id name;

- (id)shout;
- (id)sleep;
- (void)eat;

- (id)run;      // 경고뜨며 실행이 되긴하지만, 헤더파일에 선언된건 모두 소스파일에 구현햐야함

- (id)wakeUp:(id)time;    // 매개변수를 가지는 매서드
- (id)wakeUp2:(id)time date:(id)date;    // 매개변수를 가지는 매서드

@end
