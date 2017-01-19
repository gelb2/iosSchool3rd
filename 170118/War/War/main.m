
//
//  main.m
//  War
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Elf.h"

int main(int argc, const char * argv[]) {
    
    // Warrior barbarian 생성 및 설정
    Warrior *barbarian = [Warrior new];
    barbarian.name = @"바바리안";
    barbarian.hp = 100;
    barbarian.mp = 20;
    barbarian.ap = 40;
    barbarian.def = 20;
    
    // Elf thranduil 생성 및 설정
    Elf *thranduil = [[Elf alloc] init];     // Thranduil : 반지의 제왕에 나오는 엘프 이름
    thranduil.name = @"스란두일";
    thranduil.hp = 75;
    thranduil.mp = 100;
    thranduil.ap = 20;
    thranduil.def = 10;
    
    
    // Barbarian vs Thranduil
    while (true) {
        // true 나오면 배틀 끝
        if([barbarian attackTo:thranduil]) break;     // Barbarian 선빵
        if([thranduil attackTo:barbarian]) break;
    }
    
    return 0;
}
