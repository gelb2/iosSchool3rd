//
//  Elf.h
//  War
//
//  Created by Jeheon Choi on 2017. 1. 18..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Warrior;

@interface Elf : NSObject

@property NSString *name;
@property NSInteger hp;     // 체력
@property NSInteger mp;     // 마나
@property NSInteger ap;     // 공격력
@property NSInteger def;    // 방어력

- (BOOL)attackTo:(Warrior *)warrior;

@end
