//
//  Quiz.h
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property NSInteger month;

- (NSInteger)lastDayOfMonth:(NSInteger)month;

@end
