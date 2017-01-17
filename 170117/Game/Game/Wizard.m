//
//  Wizard.m
//  Game
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard


- (id)physicalAttack {
    NSLog(@"물리파워 %@으로 때립니다.",self.physicalPower);
    
    return nil;
}

- (id)magicalAttack {
    NSLog(@"매직파워 %@으로 때립니다.",self.magicalPower);
    
    return nil;
}

@end
