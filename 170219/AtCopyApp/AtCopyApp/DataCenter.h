//
//  DataCenter.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
//  Singleton

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


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



////////////////// DataCenter //////////////////

@interface DataCenter : NSObject

// AT DATA
@property (nonatomic) NSMutableArray *atDataArr;
@property (nonatomic) NSString* docuPath;

//- (void)setAtData:(AT_DATA)data withIndex:(NSInteger)index;     // index : -1 넣으면 추가, 그 외 수정
//- (AT_DATA)getAtDataWithIndex:(NSInteger)index;

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




////////////////// AT_DATA //////////////////

// AT_DATA 싱글톤 객체로 AT 데이터들 set, get함

@interface AT_DATA : NSObject

@property NSString *name;
@property NSString *startDate;        // YYYY. MM. DD. HH. MM
@property NSString *endDate;          // YYYY. MM. DD. HH. MM
@property BOOL hasTerm;       // 기간으로 설정
@property BOOL isRepeat;      // 반복 설정
@property BOOL setWidget;     // 위젯 설정
@property BOOL setBadge;      // 배지 설정
@property NSInteger character;

+ (instancetype)AtDataMakeWithName:(NSString *)name withStartDate:(NSString *) startDate withEndDate:(NSString *)endDate withHasTerm:(BOOL)hasTerm withIsRepeat:(BOOL)isRepeat withSetWidget:(BOOL)setWidget withSetBadge:(BOOL)setBadge withCharacter:(NSInteger)character;


@end



