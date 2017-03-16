//
//  DataCenter.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "DataCenter.h"
#import "NetworkModule.h"

@interface DataCenter ()

@end


@implementation DataCenter


+ (instancetype)sharedInstance {
    
    static DataCenter *dataCenter;
    
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
        
    }
    return self;
}


@end
