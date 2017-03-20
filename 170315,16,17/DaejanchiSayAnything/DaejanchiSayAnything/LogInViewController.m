//
//  LoginViewController.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "LogInViewController.h"
#import "DataCenter.h"
#import "NetworkModule.h"
#import "MainViewController.h"
#import "SignUpViewController.h"

@interface LogInViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *logInView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) UITextField *lastFirstResponder;

@end



@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialSetting];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Log In VC viewWillAppear");
    
    if ([DataCenter sharedInstance].token != nil) {
        // 자동로그인 & Sign up 후 바로 로그인
        MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self presentViewController:mainVC animated:YES completion:nil];
        
    } else {
        // 노티 설정
        NSLog(@"Log In VC 키보드 노티 설정");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillHideNotification object:nil];
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Log In VC viewWillDisappear 키보드 노티 해제");

    // 노티 해제        signUp VC에서는?
    [self initializeTextField];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    NSLog(@"Log In VC viewDidDisappear");
}


//----------------- 초기 세팅 관련 -----------------//

- (void)initialSetting {
    
    self.view.userInteractionEnabled = YES;     // TextField 외부 터치 이벤트 받기 위한 설정
    
    self.userNameTf.tag = 100;
    self.passwordTf.tag = 200;
    
    self.indicatorView.layer.cornerRadius = 5;
}


// 다른 곳 터치할 때, TextField First Responder 해제
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.lastFirstResponder isFirstResponder] && [touch view] != self.lastFirstResponder) {
        [self.lastFirstResponder resignFirstResponder];
    }
}



//----------------- UIButton 관련 -----------------//

- (IBAction)logInBtnAction:(id)sender {
    
    [self.lastFirstResponder resignFirstResponder];
    
    [self.indicator startAnimating];
    [self.indicatorView setHidden:NO];
    
    [NetworkModule logInWithUsername:self.userNameTf.text withPassword:self.passwordTf.text completionBlock:^(BOOL isSuccess, NSDictionary* result) {
        
        if(isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                [self presentViewController:mainVC animated:YES completion:nil];
                
                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];
            });
            
        } else {
            NSLog(@"%@", [result objectForKey:@"non_field_errors"]);
            self.passwordTf.text = nil;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];
            });
        }
    }];
    
}


- (IBAction)signUpBtnAction:(id)sender {
    
    SignUpViewController *signUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self presentViewController:signUpVC animated:YES completion:nil];
    
}




//----------------- 텍스트 필드, 키보드 관련 -----------------//

- (void)keyboardNoti:(NSNotification *)keyboardNoti {
    
    NSLog(@"%@", keyboardNoti.name);
    
    
    // 처음 딱 한번만, 키보드 이동할 높이 값 구하기 & Constraint 찾기
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat keyboardHeight = [keyboardNoti.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
        CGFloat logInViewBottomMarginHeight = self.view.frame.size.height - (self.logInView.frame.origin.y + self.logInView.frame.size.height);
        
        // 최소 키보드 높이 + 50씩은 뷰를 위로 올림
        [DataCenter sharedInstance].logInViewMovingHeight = (keyboardHeight + 50 - logInViewBottomMarginHeight) >= 0 ? (keyboardHeight + 50 - logInViewBottomMarginHeight) : 0;
        
        for (NSLayoutConstraint *constraint in [self.view constraints]) {
            if ([constraint.identifier isEqualToString:@"logInViewCenterConstraint"]) {
                [DataCenter sharedInstance].logInViewCenterYConstraint = constraint;
                break;
            }
        }
        
        NSLog(@"keyboardHeight : %f, logInViewBottomMarginHeight : %f, movingHeight: %f", keyboardHeight, logInViewBottomMarginHeight, [DataCenter sharedInstance].logInViewMovingHeight);
    });
    
    
    // 키보드 노티에 따라 View 위 아래로 움직임
    if([keyboardNoti.name isEqualToString:@"UIKeyboardWillShowNotification"] && !([DataCenter sharedInstance].logInViewCenterYConstraint.constant == -[DataCenter sharedInstance].logInViewMovingHeight)) {
        
        [DataCenter sharedInstance].logInViewCenterYConstraint.constant = -[DataCenter sharedInstance].logInViewMovingHeight;
        
    } else if([keyboardNoti.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        [DataCenter sharedInstance].logInViewCenterYConstraint.constant = 0;
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];

    
    
//    // 코드 방식        왜 안될까?
//
//    CGFloat keyboardHeight = [keyboardNoti.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
//    CGFloat logInViewY = self.view.frame.size.height - (self.logInView.frame.origin.y + self.logInView.frame.size.height);
//    
//    CGFloat temp = (keyboardHeight + 50 - logInViewY) >= 0 ? (keyboardHeight + 50 - logInViewY) : 0;
//    static CGRect tempFrame = self.logInView.frame;
//
//    static BOOL flag = NO;
//    
//    NSLog(@"기존 flag 값 : %d", flag);
//
//    if([keyboardNoti.name isEqualToString:@"UIKeyboardWillShowNotification"] && !flag) {
//        [UIView animateWithDuration:0.3 animations:^{
//            self.logInView.frame = CGRectMake(tempFrame.origin.x, tempFrame.origin.y-temp, tempFrame.size.width, tempFrame.size.height);
//        }];
//        
//        flag = YES;
//        NSLog(@"여기 들어옴 WillShow");
//        
//    } else if([keyboardNoti.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
//        [UIView animateWithDuration:0.3 animations:^{
//            self.logInView.frame = tempFrame;
//        }];
//
//        flag = NO;
//        NSLog(@"여기 들어옴 WillHide");
//    }
//
//    NSLog(@"flag 세팅 완료 : %d", flag);

    
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
