//
//  CustomUINavigationBar.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomUINavigationBarType) {
    HOME = 0,
    ADD,
    MENU
};



@protocol CustomUINavigationBarDelegate <NSObject>

@optional
- (void)selectedNaviBarAddBtn;
- (void)selectedNaviBarMenuBtn;
- (void)selectedNaviBarBackBtn;

@end

///////////////////

@interface CustomUINavigationBar : UIView

@property (nonatomic, weak) id <CustomUINavigationBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type;

@end
