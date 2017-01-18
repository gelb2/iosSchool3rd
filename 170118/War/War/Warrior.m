//
//  Warrior.m
//  War
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Warrior.h"
#import "Elf.h"

@implementation Warrior

- (BOOL)attackTo:(Elf *)elf {
    
    NSLog(@"%@(이)가 %@(을)를 공격!", self.name, elf.name);
    NSInteger damage = self.ap - elf.def;
    
    if(damage > 0) {
        if(damage >= elf.hp) {
            elf.hp = 0;
            NSLog(@"%@ 승리 %@ 패배", self.name, elf.name);
            
            return true;        // 끝
        }
        elf.hp -= damage;
        NSLog(@"%ld 데미지를 입혔다!", damage);
        NSLog(@"%@ 남은 HP:%ld \n", elf.name, elf.hp);
        
    } else {
        NSLog(@"miss");
        NSLog(@"%@ 남은 HP:%lu \n", elf.name, elf.hp);
    }
    
    return false;       // 계속 싸움
}

@end
