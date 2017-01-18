//
//  Warrior.h
//  Day3
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Wizard.h"     // Warrior.h와 서로 import 하면 에러발생함

@class Wizard;

@interface Warrior : NSObject

@property NSString *name;
@property NSInteger health;
@property NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;

- (void)physicalAttackTo:(Wizard *)to;

@end
