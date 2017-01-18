//
//  Wizard.h
//  Day3
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Warrior.h"     // Warrior.h의 import 되어있는 헤더파일까지 읽옴
                          // 서로 import하면 에러 생김
@class Warrior;     // 이런 문제를 해결할 수 있는 방법

@interface Wizard : NSObject

@property NSString *name;
@property NSInteger health;
@property NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;


//- (void)windstorm:(id)to;
//- (void)heal:(id)to;

- (void)magicalAttackTo:(Warrior *)to;

@end
