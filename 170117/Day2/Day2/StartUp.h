//
//  StartUp.h
//  Day2
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartUp : NSObject

@property id teamName;
@property id startingDate;
@property id crisisCnt;   // 위기가 얼마나 있었나?
@property id member;
@property id money;         // debt?
@property id product;
@property id space;
@property id stuff;
@property id softwareTool;
@property id devMethod;     // 개발방법
@property id partnerCompany;
@property id ipRight;       // patent etc
@property id investor;

- (id)isTeamAlive;      // 팀이 지금 존재하고 있나?
- (id)isProductAlive;   // 제품이 지금 존재하고 있나?
- (id)hasMeeting;
- (id)hire;
- (id)fight;
- (id)hangOut;      // 놀기
- (id)hasFunding;
- (id)develop;      // planning, SW, HW, Design Dev
- (id)launchToMarket;
- (id)operate;
- (id)hasMaintenance;
- (id)hasMnA;
- (id)hasProductBreakUp;
- (id)hasTeamBreakUp;
- (id)goToAbroad;
- (id)hasNetworking;


@end
