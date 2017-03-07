//
//  DataCenter.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "DataCenter.h"


////////////////// DataCenter //////////////////

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
    
    // Cell Color
    self.cellColor = @[[UIColor colorWithRed:101/255.0 green:199/255.0 blue:179/255.0 alpha:1],
                       [UIColor colorWithRed:152/255.0 green:207/255.0 blue:152/255.0 alpha:1],
                       [UIColor colorWithRed:216/255.0 green:212/255.0 blue:136/255.0 alpha:1],
                       [UIColor colorWithRed:240/255.0 green:185/255.0 blue:112/255.0 alpha:1],
                       [UIColor colorWithRed:239/255.0 green:150/255.0 blue:109/255.0 alpha:1]];
    
    // AT Data Docu Set
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    self.docuPath = [basePath stringByAppendingPathComponent:@"AT_DATA.plist"];
    
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

- (void)setAtData:(AT_DATA *)data withIndex:(NSInteger)index {
    
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

- (AT_DATA *)getAtDataWithIndex:(NSInteger)index {

    self.atDataArr = [NSMutableArray arrayWithContentsOfFile:self.docuPath];
    NSDictionary *dataDic = [self.atDataArr objectAtIndex:index];
    
    
    return [AT_DATA AtDataMakeWithName:[dataDic objectForKey:@"name"] withStartDate:[dataDic objectForKey:@"startDate"] withEndDate:[dataDic objectForKey:@"endDate"] withHasTerm:[[dataDic objectForKey:@"hasTerm"] boolValue] withIsRepeat:[[dataDic objectForKey:@"isRepeat"] boolValue] withSetWidget:[[dataDic objectForKey:@"setWidget"] boolValue] withSetBadge:[[dataDic objectForKey:@"setBadge"] boolValue] withCharacter:[[dataDic objectForKey:@"character"] integerValue]];
}

@end





////////////////// AT_DATA //////////////////

// AT_DATA 싱글톤 객체로 AT 데이터들 set, get함

@implementation AT_DATA

+ (instancetype)sharedAtData {
    
    static AT_DATA *data = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[AT_DATA alloc] init];
    });
    
    return data;
}


+ (AT_DATA *)AtDataMakeWithName:(NSString *)name withStartDate:(NSString *) startDate withEndDate:(NSString *)endDate withHasTerm:(BOOL)hasTerm withIsRepeat:(BOOL)isRepeat withSetWidget:(BOOL)setWidget withSetBadge:(BOOL)setBadge withCharacter:(NSInteger)character {
    
    AT_DATA *data = [AT_DATA sharedAtData];
    
    data.name = name;
    data.startDate = startDate;
    data.endDate = endDate;
    data.hasTerm = hasTerm;
    data.isRepeat = isRepeat;
    data.setWidget = setWidget;
    data.setBadge = setBadge;
    data.character = character;
    
    return data;
}

@end
