//
//  StarQuiz.m
//  StarQuiz
//
//  Created by Jeheon Choi on 2017. 2. 2..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "StarQuiz.h"

@implementation StarQuiz


+ (void)starStar:(NSUInteger)starNum mode:(NSUInteger)modeNum {
    NSLog(@"starNum: %lu, mode: %lu", starNum, modeNum);

    NSString *starStr = [[NSString alloc] init];
    
    for (NSUInteger i = 0 ; i < starNum ; i++) {
        
        switch (modeNum) {
            case 1:
                for (NSUInteger j = 0 ; j < starNum - i ; j++) {
                    starStr = [starStr stringByAppendingFormat:@"*"];
                }
                
                for (NSUInteger j = 0 ; j < i ; j++) {
                    starStr = [starStr stringByAppendingFormat:@" "];
                }
                
                break;
                
            case 2:
                for (NSUInteger j = 0 ; j <= i ; j++) {
                    starStr = [starStr stringByAppendingFormat:@"*"];
                }
                
                break;
                
            case 3:
                for (NSUInteger j = 0 ; j < starNum - i -1 ; j++) {
                    starStr = [starStr stringByAppendingFormat:@" "];
                }
                
                for (NSUInteger j = 0 ; j <= i ; j++) {
                    starStr = [starStr stringByAppendingFormat:@"*"];
                }
                
                break;
                
            case 4:
                for (NSUInteger j = i ; j < starNum - 1 ; j++) {
                    starStr = [starStr stringByAppendingFormat:@" "];
                }
                
                for (NSUInteger j = starNum - i ; j <= starNum ; j++) {
                    starStr = [starStr stringByAppendingFormat:@"*"];
                    starStr = [starStr stringByAppendingFormat:@" "];
                }
                
                break;
        }
        

        NSLog(@"%@", starStr);  // Log찍고
        starStr = @"";          // 값 초기화
    }
    NSLog(@"");
}


@end
