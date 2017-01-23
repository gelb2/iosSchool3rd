//
//  Man.h
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Person.h"

@interface Man : Person

- (void)depositTo:(Bank *)bank amount:(NSUInteger)money;
- (void)makeCardFrom:(Bank *)bank;


@end
