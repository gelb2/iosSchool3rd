//
//  Bank.h
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;  // 세미콜론 붙여야 함

@interface Bank : NSObject

@property NSString *name;
@property NSString *location;

- (void)transferFrom:(Person *)from To:(Person *)to Money:(NSUInteger)money;
- (void)addressTo:(NSString *)to;

@end
