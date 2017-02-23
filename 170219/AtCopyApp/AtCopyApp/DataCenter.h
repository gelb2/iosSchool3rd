//
//  DataCenter.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//  Singleton

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property NSMutableArray *switcherValue;

+ (instancetype)sharedInstance;

- (void)hasSwitcherValueIndex:(NSInteger)index;

@end
