//
//  main.m
//  MorningAlgorithm170217
//
//  Created by Jeheon Choi on 2017. 2. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Steps.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Steps *st = [[Steps alloc] init];
        NSLog(@"%ld", [st stepCaseNumWithSteps:4]);
        NSLog(@"%ld", [st stepCaseNumWithSteps:5]);
        NSLog(@"%ld", [st stepCaseNumWithSteps:6]);
        
    }
    return 0;
}
