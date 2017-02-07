//
//  LoginView.m
//  LoginPage
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
<UIScrollViewDelegate, UITextFieldDelegate>

@property UITextField *pwTF;

@property UIButton *loginBtn;
@property UIButton *signUpBtn;

@end

@implementation LoginView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentSize:frame.size];
//        [self setBackgroundColor:[UIColor lightGrayColor]];

        [self setLoginViews];
    }
    return self;
}


- (void)setLoginViews
{
    
    // ID UILabel
    UILabel *idLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 30, 35)];
    [idLb setText:@"ID"];
    [idLb setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:idLb];
    
    // ID UITextField
    UITextField *idTF = [[UITextField alloc] initWithFrame:CGRectMake(50 + idLb.frame.size.width, idLb.frame.origin.y, self.frame.size.width - (90 + idLb.frame.size.width), idLb.frame.size.height)];
    [idTF setBorderStyle:UITextBorderStyleRoundedRect];
    idTF.tag = 100;
    idTF.delegate = self;
    
    [idTF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self addSubview:idTF];
    
    // PW UILabel
    UILabel *pwLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 20 + idLb.frame.origin.y +idLb.frame.size.height , 30, 35)];
    [pwLb setText:@"PW"];
    [pwLb setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:pwLb];
    
    // PW UITextField
    self.pwTF = [[UITextField alloc] initWithFrame:CGRectMake(50 + pwLb.frame.size.width, pwLb.frame.origin.y, self.frame.size.width - (90 + pwLb.frame.size.width), pwLb.frame.size.height)];
    [self.pwTF setBorderStyle:UITextBorderStyleRoundedRect];
    self.pwTF.tag = 200;
    self.pwTF.delegate = self;
    
    [self.pwTF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self.pwTF setSecureTextEntry:YES];
    [self addSubview:self.pwTF];
    
    // Login UIButton
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginBtn setFrame:CGRectMake(self.frame.size.width/4 - 50 + 20, pwLb.frame.origin.y + pwLb.frame.size.height + 15, 100, 35)];
    [self.loginBtn setTitle:@"Log in" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.tag = 1000;
    [self addSubview:self.loginBtn];
    
    // SignUp UIButton
    self.signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.signUpBtn setFrame:CGRectMake(self.frame.size.width*3/4 - 50 - 20, pwLb.frame.origin.y + pwLb.frame.size.height + 15, 100, 35)];
    [self.signUpBtn setTitle:@"Sign up" forState:UIControlStateNormal];
    [self.signUpBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.signUpBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.signUpBtn.tag = 2000;
    [self addSubview:self.signUpBtn];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setContentOffset:CGPointMake(0, 85) animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self setContentOffset:CGPointMake(0, 0) animated:YES];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag == 100) {
        [self.pwTF becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self selectedBtn:self.loginBtn];
    }
    return YES;
}


- (void)selectedBtn:(UIButton *)sender
{
    if(sender.tag == 1000) {
        NSLog(@"Log in");
    } else {
        NSLog(@"Sign up");
    }
}


@end
