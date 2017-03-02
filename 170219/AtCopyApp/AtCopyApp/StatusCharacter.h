//
//  StatusCharacter.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, StatusCharacterView) {
    SINGLE_CHARACTER = 0,
    CHARACTER_LIST
};


@interface StatusCharacter : UIView

- (void)setCharacterType:(NSInteger)typeNum;

- (instancetype)initWithViewVer:(NSInteger)viewVer;

- (void)characterListView;

//+ (UIView *)getCharacterListView;

@end
