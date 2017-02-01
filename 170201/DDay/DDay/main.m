//
//  main.m
//  DDay
//
//  Created by Jeheon Choi on 2017. 2. 1..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDay.h"

int main(int argc, const char * argv[]) {
    
    // 1
    NSLog(@"%d",[DDay checkLeapYear:1955]);
    NSLog(@"%d",[DDay checkLeapYear:2000]);
    
    // 2
    NSLog(@"%ld", [DDay lastDayOfMonth:2 year:2000]);
    NSLog(@"%ld", [DDay lastDayOfMonth:2 year:1999]);
    
    // 3
    NSLog(@"D-%ldD", [DDay firstDay:@"2016/01/29" lastDay:@"2017/01/31"]);
    NSLog(@"D-%ldD", [DDay firstDay:@"2016/01/29" lastDay:@"2016/01/31"]);
    NSLog(@"D-%ldD", [DDay firstDay:@"2016/01/29" lastDay:@"2019/01/31"]);

    return 0;
}
