//
//  SignUpViewController.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataCenter.h"
#import "NetworkModule.h"
#import "MainViewController.h"


@interface SignUpViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *signUpView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *password1Tf;
@property (weak, nonatomic) IBOutlet UITextField *password2Tf;

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) UITextField *lastFirstResponder;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"SignUp VC viewDidLoad");    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"SignUp VC viewWillAppear");
    
    [self initialSetting];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"SignUp VC viewDidAppear");
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"SignUp VC viewWillDisappear");
    
    [self initializeTextField];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


//----------------- 초기 세팅 관련 -----------------//

- (void)initialSetting {
    
    self.view.userInteractionEnabled = YES;     // TextField 외부 터치 이벤트 받기 위한 설정
    
    self.userNameTf.tag = 100;
    self.password1Tf.tag = 200;
    self.password2Tf.tag = 300;
    
    self.indicatorView.layer.cornerRadius = 5;
    
    // constraint 주소 값이 매번 바뀌는 듯?    
    for (NSLayoutConstraint *constraint in [self.view constraints]) {
        if ([constraint.identifier isEqualToString:@"signUpViewCenterConstraint"]) {
            [DataCenter sharedInstance].signUpViewCenterYConstraint = constraint;
            break;
        }
    }
    
    // 키보드 노티 설정
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillHideNotification object:nil];

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

- (IBAction)signUpDoneBtnAction:(id)sender {
    
    [self.lastFirstResponder resignFirstResponder];
    
    [self.indicator startAnimating];
    [self.indicatorView setHidden:NO];
    
    [NetworkModule signUpWithUsername:self.userNameTf.text withPassword1:self.password1Tf.text withPassword2:self.password2Tf.text completionBlock:^(BOOL isSuccess, NSDictionary *result) {
        
        if(isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);

            dispatch_async(dispatch_get_main_queue(), ^{        // 이 부분 메인 스레드 돌여야 하는 이유?

                // dismiss한 후 Login VC viewWillAppear에서 바로 Token 값 nil 체크해서, nil이 아닐시 main VC로 넘어가게 되어있음
                [self dismissViewControllerAnimated:YES completion:nil];
            
                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];
                
            });
            
        } else {
            NSLog(@"%@", result);
            
            self.password1Tf.text = nil;
            self.password2Tf.text = nil;
            
            dispatch_async(dispatch_get_main_queue(), ^{
            
                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];
            });
        }
    }];
}

- (IBAction)cancelBtnAction:(id)sender {
    
    [self initializeTextField];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



//----------------- 텍스트 필드, 키보드 관련 -----------------//

- (void)keyboardNoti:(NSNotification *)keyboardNoti {
    
    NSLog(@"%@", keyboardNoti.name);
    NSLog(@"movingHeight: %f", [DataCenter sharedInstance].signUpViewMovingHeight);
    
    
    // 처음 딱 한번만, 키보드 이동할 높이 값 구하기 & Constraint 찾기
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        CGFloat keyboardHeight = [keyboardNoti.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
        CGFloat signUpViewBottomMarginHeight = self.view.frame.size.height - (self.signUpView.frame.origin.y + self.signUpView.frame.size.height);
        
        // 최소 키보드 높이 + 50씩은 뷰를 위로 올림
        [DataCenter sharedInstance].signUpViewMovingHeight = (keyboardHeight + 50 - signUpViewBottomMarginHeight) >= 0 ? (keyboardHeight + 50 - signUpViewBottomMarginHeight) : 0;
        
        
        NSLog(@"self.view.frame.size.height : %f, (self.signUpView.frame.origin.y + self.signUpView.frame.size.height) : %f", self.view.frame.size.height, self.signUpView.frame.origin.y + self.signUpView.frame.size.height);
        NSLog(@"keyboardHeight : %f, signUpViewBottomMarginHeight : %f, movingHeight: %f", keyboardHeight, signUpViewBottomMarginHeight, [DataCenter sharedInstance].signUpViewMovingHeight);
    });
    
    
    NSLog(@"%d, %f", !([DataCenter sharedInstance].signUpViewCenterYConstraint.constant == -[DataCenter sharedInstance].signUpViewMovingHeight), [DataCenter sharedInstance].signUpViewMovingHeight);
    
    // 키보드 노티에 따라 View 위 아래로 움직임
    if([keyboardNoti.name isEqualToString:@"UIKeyboardWillShowNotification"] && !([DataCenter sharedInstance].signUpViewCenterYConstraint.constant == -[DataCenter sharedInstance].signUpViewMovingHeight)) {

        [DataCenter sharedInstance].signUpViewCenterYConstraint.constant = -[DataCenter sharedInstance].signUpViewMovingHeight;
        
    } else if([keyboardNoti.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        [DataCenter sharedInstance].signUpViewCenterYConstraint.constant = 0;
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"textFieldShouldBeginEditing");
    self.lastFirstResponder = textField;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == self.userNameTf.tag) {
        [self.password1Tf becomeFirstResponder];
    } else if (textField.tag == self.password1Tf.tag) {
        [self.password2Tf becomeFirstResponder];
    } else {
        [self.password2Tf resignFirstResponder];
        [self signUpDoneBtnAction:nil];
    }
    
    return YES;
}


// TextField 관련 초기화
- (void)initializeTextField {
    if ([self.lastFirstResponder isFirstResponder]) {
        [self.lastFirstResponder resignFirstResponder];
    }
    
    self.userNameTf.text = nil;
    self.password1Tf.text = nil;
    self.password2Tf.text = nil;
}


@end
