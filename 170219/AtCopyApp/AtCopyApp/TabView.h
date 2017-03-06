//
//  TabView.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 3. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol TabViewDelegate <NSObject>

- (void)selectedTabViewLeftBtn:(UIButton *)btn;
- (void)selectedTabViewMiddleBtn:(UIButton *)btn;
- (void)selectedTabViewRightBtn:(UIButton *)btn;

@end

///////////////////

@interface TabView : UIView

@property (nonatomic, weak) id <TabViewDelegate> delegate;

@end
