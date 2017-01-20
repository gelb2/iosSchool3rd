//
//  Person.h
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bank;    // 세미콜론 붙여야 함

@interface Person : NSObject

@property NSString *name;
@property NSInteger asset;

- (void)depositTo:(Bank *)bank Money:(NSUInteger)money;
- (void)checkAccount:(Bank *)bank;

@end
