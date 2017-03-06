//
//  DataCenter.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//  Singleton

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#define TOTAL_CHARACTER_NUM 2

typedef NS_ENUM(NSInteger, ArrDataType) {
    ADD1 = 0,
    ADD2,
    CUSTOM,
    MORE
};

typedef NS_ENUM(NSInteger, AddTableViewCellType) {
    TITLE = 0,
    DATE,
    DATE2,
    DEFAULT1,       // 기간으로 설정
    DEFAULT2,       // 반복 설정
    DEFAULTINFO1,   // 위젯 설정
    DEFAULTINFO2,    // 배지 설정
    CHARACTERLIST
};

@interface DataCenter : NSObject

@property (nonatomic) NSMutableArray *atDataArr;

@property (nonatomic) NSArray *cellColor;
@property (nonatomic) NSArray *addArrData;

+ (instancetype)sharedInstance;
- (void)setInitialData;

// ADD View
@property (nonatomic, weak) UIImageView *pickedImg;

+ (NSInteger)addCellTypeStr2Num:(NSString *)cellTypeStr;
+ (double)getAddCellHeight:(NSString *)cellTypeStr;


+ (void)addAtData;
+ (NSDictionary *)getAtDataWithNum:(NSInteger)num;

@end
