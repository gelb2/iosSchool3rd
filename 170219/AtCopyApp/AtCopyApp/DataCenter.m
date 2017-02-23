//
//  DataCenter.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    
    return dataCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.switcherValue = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)hasSwitcherValueIndex:(NSInteger)index {
    if (index+1 > self.switcherValue.count) {
        [self.switcherValue addObject:@0];
    }
}


@end
