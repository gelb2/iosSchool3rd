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
    
    // AT Data Docu Set
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"AT_DATA"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"AT_DATA" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    self.atDataArr = [NSMutableArray arrayWithContentsOfFile:docuPath];
    
    
    
    // ADD View
    
    self.addArrData = @[@[@"TITLE", @"DATE", @"DEFAULT1", @"DEFAULT2", @"DEFAULTINFO1", @"DEFAULTINFO2", @"CHARACTERLIST"],      // ADD1
                        @[@"TITLE", @"DATE2", @"DEFAULT1", @"DEFAULT2", @"DEFAULTINFO1", @"DEFAULTINFO2", @"CHARACTERLIST"]];    // ADD2
    
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
    } else if ([cellTypeStr isEqualToString:@"CHARACTERLIST"]) {
        return CHARACTERLIST;
    } else if ([cellTypeStr isEqualToString:@"DEFAULTINFO1"]) {
        return DEFAULTINFO1;
    } else if ([cellTypeStr isEqualToString:@"DEFAULTINFO2"]) {
        return DEFAULTINFO2;
    } else if ([cellTypeStr isEqualToString:@"DEFAULT2"]) {
        return DEFAULT2;
    } else {    // DEFAULT
        return DEFAULT1;
    }
}

+ (double)getAddCellHeight:(NSString *)cellTypeStr {
    
    switch ([self addCellTypeStr2Num:cellTypeStr]) {
        case TITLE:
            return 100;
        case DATE:
            return 135;
        case DATE2:
            return 240;
        case CHARACTERLIST:
            return 180;
        default:    // DEFAULT 전부
            return 75;
    }
}


//

- (void)addAtData {
//    [self.atDataArr addObject:<#(nonnull id)#>]
    
}


@end
