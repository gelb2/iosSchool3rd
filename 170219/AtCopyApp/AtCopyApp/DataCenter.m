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
    self.docuPath = [basePath stringByAppendingPathComponent:@"AT_DATA"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:self.docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"AT_DATA" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:self.docuPath error:nil];
    }
    
    self.atDataArr = [NSMutableArray arrayWithContentsOfFile:self.docuPath];
    
    
    
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


// AT Data 관련 메소드들

- (void)setAtData:(AT_DATA)data withIndex:(NSInteger)index {
    
    if (!data.hasTerm) {
        data.endDate = @"0000. 00. 00";
    } else if (data.isRepeat) {     // data.hasTerm && data.isRepeat 상황
        data.endDate = data.startDate;
    }
    
    NSDictionary *dataDic = @{ @"name":data.name,
                               @"startDate":data.startDate,
                               @"endDate":data.endDate,
                               @"hasTerm":[NSNumber numberWithBool:data.hasTerm],
                               @"isRepeat":[NSNumber numberWithBool:data.isRepeat],
                               @"setWidget":[NSNumber numberWithBool:data.setWidget],
                               @"setBadge":[NSNumber numberWithBool:data.setBadge],
                               @"character":[NSNumber numberWithInteger:data.character] };
    
    
    if (index == -1) {        // index = -1일 때, 생성
        [self.atDataArr addObject:dataDic];
    } else {    // 기존 데이터 수정
        [self.atDataArr replaceObjectAtIndex:index withObject:dataDic];
    }
    
    // Document에 저장
    [self.atDataArr writeToFile:self.docuPath atomically:NO];
}

- (AT_DATA)getAtDataWithIndex:(NSInteger)index {

    self.atDataArr = [NSMutableArray arrayWithContentsOfFile:self.docuPath];
    NSDictionary *dataDic = [self.atDataArr objectAtIndex:index];
    
    return AtDataMake([dataDic objectForKey:@"name"], [dataDic objectForKey:@"startDate"], [dataDic objectForKey:@"endDate"], [[dataDic objectForKey:@"hasTerm"] boolValue], [[dataDic objectForKey:@"isRepeat"] boolValue], [[dataDic objectForKey:@"setWidget"] boolValue], [[dataDic objectForKey:@"setBadge"] boolValue], [[dataDic objectForKey:@"character"] integerValue]);
}


@end
