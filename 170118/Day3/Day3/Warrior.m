//
//  Warrior.m
//  Day3
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"     // 소스파일에서는 import해야함

@implementation Warrior

- (void)physicalAttackTo:(Wizard *)to {
        
    to.health -= self.physicalPower;
    NSLog(@"%@가 %@에게 물리파워 %ld으로 때립니다.",self.name,to.name,self.physicalPower);
    NSLog(@"%@의 남은 HP : %ld ",to.name,to.health);

}

@end
