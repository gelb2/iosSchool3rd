//
//  Wizard.h
//  Game
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wizard : NSObject

@property id health;
@property id mana;
@property id physicalPower;
@property id magicalPower;
@property id weapon;

- (id)physicalAttack;
- (id)magicalAttack;

@end
