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

- (void)setLoginViews;

@end


@protocol LoginViewDelegate <NSObject>



@end
