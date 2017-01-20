//
//  Man.h
//  Test
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//@class Bank;      // Person.h에 있으므로 없어도 됨

@interface Man : Person

//- (void)depositTo:(Bank *)bank Money:(NSUInteger)money;     // 없어도 됨
- (void)makeCardFrom:(Bank *)bank;


@end
