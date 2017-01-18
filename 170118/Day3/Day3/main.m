//
//  main.m
//  Day3
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"


int main(int argc, const char * argv[]) {
    
    // Warrior 바바리안 생성
    Warrior *barbarian = [[Warrior alloc] init];
    barbarian.name = @"barbarian";
    barbarian.health = 1000;
    barbarian.mana = 150;
    barbarian.physicalPower = 200;
    barbarian.magicalPower = 50;
    
    // Warrior 프랑켄슈타인 생성
    Warrior *frankenstein = [Warrior new];
    frankenstein.name = @"frankenstein";
    frankenstein.health = 3000;
    frankenstein.mana = 0;
    frankenstein.physicalPower = 20;
    frankenstein.magicalPower = 20;
    
    // Wizard 매지션 생성
    Wizard *magician = [[Wizard alloc] init];
    magician.name = @"magician";
    magician.health = 800;
    magician.mana = 400;
    magician.physicalPower = 200;
    magician.magicalPower = 250;

    // Wizard 위치 생성
    Wizard *witch = [Wizard new];
    witch.name = @"witch";
    witch.health = 1000;
    witch.mana = 700;
    witch.physicalPower = 400;
    witch.magicalPower = 400;

    
    //pvp
    //워리어가 위자드 공격
    [barbarian physicalAttackTo:magician];

    
    //위자드가 워리어 공격
    [magician magicalAttackTo:barbarian];

    return 0;
}
