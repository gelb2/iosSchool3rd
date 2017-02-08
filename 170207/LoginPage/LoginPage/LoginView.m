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

@property UILabel *idLb;
@property UITextField *idTF;
@property UIButton *loginBtn;

@property UILabel *pwLb;
@property UITextField *pwTF;
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
    self.idLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 30, 35)];
    [self.idLb setText:@"ID"];
    [self.idLb setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.idLb];
    
    // ID UITextField
    self.idTF = [[UITextField alloc] initWithFrame:CGRectMake(50 + self.idLb.frame.size.width, self.idLb.frame.origin.y, self.frame.size.width - (90 + self.idLb.frame.size.width), self.idLb.frame.size.height)];
    [self.idTF setBorderStyle:UITextBorderStyleRoundedRect];
    self.idTF.tag = 100;
    self.idTF.delegate = self;
    
    [self.idTF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self addSubview:self.idTF];
    
    // PW UILabel
    self.pwLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 20 + self.idLb.frame.origin.y +self.idLb.frame.size.height , 30, 35)];
    [self.pwLb setText:@"PW"];
    [self.pwLb setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.pwLb];
    
    // PW UITextField
    self.pwTF = [[UITextField alloc] initWithFrame:CGRectMake(50 + self.pwLb.frame.size.width, self.pwLb.frame.origin.y, self.frame.size.width - (90 + self.pwLb.frame.size.width), self.pwLb.frame.size.height)];
    [self.pwTF setBorderStyle:UITextBorderStyleRoundedRect];
    self.pwTF.tag = 200;
    self.pwTF.delegate = self;
    
    [self.pwTF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self.pwTF setSecureTextEntry:YES];
    [self addSubview:self.pwTF];
    
    // Login UIButton
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginBtn setFrame:CGRectMake(self.frame.size.width/4 - 50 + 20, self.pwLb.frame.origin.y + self.pwLb.frame.size.height + 15, 100, 35)];
    [self.loginBtn setTitle:@"Log in" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.tag = 1000;
    [self addSubview:self.loginBtn];
    
    // SignUp UIButton
    self.signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.signUpBtn setFrame:CGRectMake(self.frame.size.width*3/4 - 50 - 20, self.pwLb.frame.origin.y + self.pwLb.frame.size.height + 15, 100, 35)];
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
    } else if(textField.tag == 200) {
        [textField resignFirstResponder];
        [self selectedBtn:self.loginBtn];
    }
    return YES;
}


- (void)selectedBtn:(UIButton *)sender
{
    [self.idTF resignFirstResponder];
    [self.pwTF resignFirstResponder];
    if(sender.tag == 1000) {
        NSLog(@"Log in ID : %@  PW : %@",[self.idTF text], [self.pwTF text]);
        [self.delegate selectedLoginBtnWithID:[self.idTF text] withPW:[self.pwTF text]];
    } else if (sender.tag == 2000) {
        NSLog(@"Sign up");
    }
}


@end
