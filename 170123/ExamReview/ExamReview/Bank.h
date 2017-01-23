//
//  Bank.h
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Bank : NSObject

@property NSString *name;
@property NSString *location;

- (void)moveTo:(NSString *)location;
- (void)transferTo:(Person *)toPerson from:(Person *)fromPerson amount:(NSUInteger)money;

@end
