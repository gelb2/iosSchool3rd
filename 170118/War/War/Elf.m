//
//  Elf.m
//  War
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Elf.h"
#import "Warrior.h"

@implementation Elf

- (BOOL)attackTo:(Warrior *)warrior {
 
    NSLog(@"%@(이)가 %@(을)를 공격!",self.name,warrior.name);
    NSInteger damage = self.ap - warrior.def;
    
    if(damage > 0) {
        if(damage >= warrior.hp) {
            warrior.hp = 0;
            NSLog(@"%@ 승리 %@ 패배", self.name, warrior.name);
            
            return true;        // 끝
        }
        warrior.hp -= damage;
        NSLog(@"%ld데미지를 입혔다!", damage);
        NSLog(@"%@ 남은 HP:%ld \n", warrior.name, warrior.hp);
    } else {
        NSLog(@"miss \n%@ 남은 HP:%lu \n", warrior.name, warrior.hp);
    }
    
    return false;   // 계속 싸움
}

@end
