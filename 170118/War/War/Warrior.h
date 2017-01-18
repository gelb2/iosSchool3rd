//
//  Warrior.h
//  War
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Elf;

@interface Warrior : NSObject

@property NSString *name;
@property NSInteger hp;     // 체력
@property NSInteger mp;     // 마나
@property NSUInteger ap;     // 공격력
@property NSUInteger def;    // 방어력

- (BOOL)attackTo:(Elf *)elf;

@end
