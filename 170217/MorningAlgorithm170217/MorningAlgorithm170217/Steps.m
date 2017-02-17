//
//  Steps.m
//  MorningAlgorithm170217
//
//  Created by Jeheon Choi on 2017. 2. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Steps.h"

@interface Steps ()

@property NSInteger count;

@end

@implementation Steps


- (instancetype)init {
    self = [super init];
    if(self) {
        
    }
    
    return self;
}

- (NSInteger)stepCaseNumWithSteps:(NSInteger)steps {
    self.count = 0;
    return [self stepCaseAlgorithm:steps];
}

- (NSInteger)stepCaseAlgorithm:(NSInteger)restSteps {
    for (NSInteger i = 1; i <= 2; i++) {
        if (restSteps - i == 0) {
            self.count++;
        } else if (restSteps - i > 0) {
            [self stepCaseAlgorithm:restSteps - i];
        }
    }
    return self.count;
}


@end
