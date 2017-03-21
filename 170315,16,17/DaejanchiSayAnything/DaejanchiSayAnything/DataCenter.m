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



#pragma mark - Token setter, getter, remover

+ (void)setUserTokenWithStr:(NSString *)tokenStr {
    [[NSUserDefaults standardUserDefaults] setObject:tokenStr forKey:@"UserToken"];
}

+ (NSString *)getUserToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UserToken"];
}

+ (void)removeUserToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserToken"];
}


@end
