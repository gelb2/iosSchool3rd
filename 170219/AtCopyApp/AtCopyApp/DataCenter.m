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
        [self setInitialData];
    }
    return self;
}

- (void)setInitialData {
    self.addArrData = @[@[@"TITLE", @"DATE", @"DEFAULT", @"DEFAULT2", @"DEFAULTINFO", @"DEFAULTINFO", @"CHARACTER"],      // ADD1
                        @[@"TITLE", @"DATE2", @"DEFAULT", @"DEFAULT2", @"DEFAULTINFO", @"DEFAULTINFO", @"CHARACTER"]];    // ADD2
    
}


// ADD View

+ (NSInteger)addCellTypeStr2Num:(NSString *)cellTypeStr {
    
    // Str to Num
    if ([cellTypeStr isEqualToString:@"TITLE"]) {
        return TITLE;
    } else if ([cellTypeStr isEqualToString:@"DATE"]) {
        return DATE;
    } else if ([cellTypeStr isEqualToString:@"DATE2"]) {
        return DATE2;
    } else if ([cellTypeStr isEqualToString:@"CHARACTER"]) {
        return CHARACTER;
    } else if ([cellTypeStr isEqualToString:@"DEFAULTINFO"]) {
        return DEFAULTINFO;
    } else if ([cellTypeStr isEqualToString:@"DEFAULT2"]) {
        return DEFAULT2;
    } else {    // DEFAULT
        return DEFAULT;
    }
}

+ (double)getAddCellHeight:(NSString *)cellTypeStr {
    
    switch ([self addCellTypeStr2Num:cellTypeStr]) {
        case TITLE:
            return 100;
        case DATE:
            return 135;
        case DATE2:
            return 170;
        case CHARACTER:
            return 180;
        case DEFAULTINFO:
        case DEFAULT2:
        default:    // DEFAULT
            return 75;
    }
}


@end
