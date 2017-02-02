//
//  main.m
//  StarQuiz
//
//  Created by Jeheon Choi on 2017. 2. 2..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StarQuiz.h"

int main(int argc, const char * argv[]) {
    
    NSUInteger starNum = 5;
    
    for(NSUInteger i = 1; i < 5 ; i++) {
        [StarQuiz starStar:starNum mode:i];
    }
    
    return 0;
}
