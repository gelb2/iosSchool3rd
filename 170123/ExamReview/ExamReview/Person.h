//
//  Person.h
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bank.h"

@interface Person : NSObject

@property NSString *name;
@property NSInteger asset;

- (void)depositTo:(Bank *)bank amount:(NSUInteger)money;

- (void)checkAccount:(Bank *)bank;

@end
