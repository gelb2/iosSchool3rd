//
//  LoginViewController.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"
#import "NetworkModule.h"
#import "MainViewController.h"
#import "SignUpViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@property (weak, nonatomic) UITextField *lastFirstResponder;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialSetting];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialSetting {
    
    self.userNameTf.tag = 100;
    self.passwordTf.tag = 200;
    
}


// 노티 설정
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Login VC viewWillAppear 키보드 노티 설정");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillHideNotification object:nil];
}

// 노티 해제        signUp VC에서는?
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Login VC viewWillDisappear 키보드 노티 해제");
    
    [self initializeTextField];    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    NSLog(@"Login VC viewDidDisappear");
}



- (IBAction)logInBtnAction:(id)sender {
    
    [NetworkModule logInWithUsername:self.userNameTf.text withPassword:self.passwordTf.text completionBlock:^(BOOL isSuccess, NSDictionary* result) {
        
        if(isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);
            
            MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
            [self presentViewController:mainVC animated:YES completion:nil];
            
        } else {
            NSLog(@"%@", result);
        }
    }];
}


- (IBAction)signUpBtnAction:(id)sender {
    
    SignUpViewController *signUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self presentViewController:signUpVC animated:YES completion:nil];
    
}

- (void)keyboardNoti:(NSNotification *)keyboardNoti {
    
    NSLog(@"%@", keyboardNoti.name);
    
    
    // 처음 딱 한번만, 키보드 이동할 높이 값 구하기 & Constraint 찾기
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat keyboardHeight = [keyboardNoti.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
        CGFloat loginViewBottomMarginHeight = self.view.frame.size.height - (self.loginView.frame.origin.y + self.loginView.frame.size.height);
        
        // 최소 키보드 높이 + 50씩은 뷰를 위로 올림
        [DataCenter sharedInstance].loginViewMovingHeight = (keyboardHeight + 50 - loginViewBottomMarginHeight) >= 0 ? (keyboardHeight + 50 - loginViewBottomMarginHeight) : 0;
        
        for (NSLayoutConstraint *constraint in [self.view constraints]) {
            if ([constraint.identifier isEqualToString:@"loginViewCenterConstraint"]) {
                [DataCenter sharedInstance].loginViewCenterYConstraint = constraint;
                break;
            }
        }
        
        NSLog(@"keyboardHeight : %f, loginViewBottomMarginHeight : %f, movingHeight: %f", keyboardHeight, loginViewBottomMarginHeight, [DataCenter sharedInstance].loginViewMovingHeight);
    });
    
    
    // 키보드 노티에 따라 View 위 아래로 움직임
    if([keyboardNoti.name isEqualToString:@"UIKeyboardWillShowNotification"] && !([DataCenter sharedInstance].loginViewCenterYConstraint.constant == -[DataCenter sharedInstance].loginViewMovingHeight)) {
        
        [DataCenter sharedInstance].loginViewCenterYConstraint.constant = -[DataCenter sharedInstance].loginViewMovingHeight;
        
    } else if([keyboardNoti.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        [DataCenter sharedInstance].loginViewCenterYConstraint.constant = 0;
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];

    
    
//    // 코드 방식
//
//    CGFloat keyboardHeight = [keyboardNoti.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
//    CGFloat loginViewY = self.view.frame.size.height - (self.loginView.frame.origin.y + self.loginView.frame.size.height);
//    
//    CGFloat temp = (keyboardHeight + 50 - loginViewY) >= 0 ? (keyboardHeight + 50 - loginViewY) : 0;
//    CGRect tempFrame = self.loginView.frame;
//
//    
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        if([keyboardNoti.name isEqualToString:@"UIKeyboardDidShowNotification"]) {
//            self.loginView.frame = CGRectMake(tempFrame.origin.x, tempFrame.origin.y-temp, tempFrame.size.width, tempFrame.size.height);
//        } else if([keyboardNoti.name isEqualToString:@"UIKeyboardDidHideNotification"]) {
//            self.loginView.frame = self.loginView.frame;
//        }
//
//    }];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"textFieldShouldBeginEditing");
    self.lastFirstResponder = textField;
    
    return YES;
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == self.userNameTf.tag) {
        [self.passwordTf becomeFirstResponder];
        
    } else {
        [self.passwordTf resignFirstResponder];
        [self logInBtnAction:nil];
    }
    return YES;
}


// TextField 관련 초기화
- (void)initializeTextField {
    if ([self.lastFirstResponder isFirstResponder]) {
        [self.lastFirstResponder resignFirstResponder];
    }
    
    self.userNameTf.text = nil;
    self.passwordTf.text = nil;
}

@end
