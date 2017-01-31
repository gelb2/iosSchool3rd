//
//  Toolbox.m
//  Exam0131
//
//  Created by Jeheon Choi on 2017. 1. 31..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Toolbox.h"

@implementation Toolbox

+ (BOOL)isDevloper:(Person *)person {
    if([person.job isEqualToString:@"Developer"]) {     // if (![person.job compare:@"Developer"])
        NSLog(@"%@은 Developer다.", person.name);
        return TRUE;
    }
    else {
        NSLog(@"%@은 Developer가 아니다.", person.name);
        return FALSE;
    }
}

@end
