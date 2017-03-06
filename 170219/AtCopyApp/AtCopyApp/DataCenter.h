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

typedef struct AT_DATA {
    __unsafe_unretained NSString *name;
    __unsafe_unretained NSString *startDate;        // YYYY. MM. DD. HH. MM
    __unsafe_unretained NSString *endDate;          // YYYY. MM. DD. HH. MM
    BOOL hasTerm;       // 기간으로 설정
    BOOL isRepeat;      // 반복 설정
    BOOL setWidget;     // 위젯 설정
    BOOL setBadge;      // 배지 설정
    NSInteger character;
} AT_DATA;

AT_DATA AtDataMake(NSString *name, NSString* startDate, NSString *endDate, BOOL hasTerm, BOOL isRepeat, BOOL setWidget, BOOL setBadge, NSInteger character)
{
    AT_DATA data;
    
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



////////////////////

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

// AT DATA
@property (nonatomic) NSMutableArray *atDataArr;
@property (nonatomic) NSString* docuPath;

- (void)setAtData:(AT_DATA)data withIndex:(NSInteger)index;     // index : -1 넣으면 추가, 그 외 수정
- (AT_DATA)getAtDataWithIndex:(NSInteger)index;

//////////

@property (nonatomic) NSArray *cellColor;
@property (nonatomic) NSArray *addArrData;

+ (instancetype)sharedInstance;
- (void)setInitialData;

// ADD View
@property (nonatomic, weak) UIImageView *pickedImg;

+ (NSInteger)addCellTypeStr2Num:(NSString *)cellTypeStr;
+ (double)getAddCellHeight:(NSString *)cellTypeStr;



@end
