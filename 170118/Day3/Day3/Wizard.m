//
//  Wizard.m
//  Day3
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Wizard.h"
#import "Warrior.h"     // 소스파일에서는 import해야함

@implementation Wizard

- (void)magicalAttackTo:(Warrior *)to {
    
    to.health -= self.magicalPower;
    NSLog(@"%@가 %@에게 매직파워 %ld으로 때립니다.",self.name,to.name,self.magicalPower);
    NSLog(@"%@의 남은 HP : %ld ",to.name,to.health);
    
}

@end
