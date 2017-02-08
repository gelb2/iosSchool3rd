//
//  LoginView.h
//  LoginPage
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate;


@interface LoginView : UIScrollView

@property (nonatomic, weak) id <LoginViewDelegate> delegate;

- (void)setLoginViews;

@end


@protocol LoginViewDelegate <NSObject>

- (BOOL)selectedLoginBtnWithID:(NSString *)ID withPW:(NSString *)PW;

@end
