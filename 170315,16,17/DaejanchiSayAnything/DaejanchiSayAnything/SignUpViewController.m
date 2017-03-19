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

- (void)initialSetting {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNoti:) name:UIKeyboardWillHideNotification object:nil];
    
    self.userNameTf.tag = 100;
    self.password1Tf.tag = 200;
    self.password2Tf.tag = 300;
    
    
    // constraint 주소 값이 매번 바뀌는 듯?    
    for (NSLayoutConstraint *constraint in [self.view constraints]) {
        if ([constraint.identifier isEqualToString:@"signUpViewCenterConstraint"]) {
            [DataCenter sharedInstance].signUpViewCenterYConstraint = constraint;
            break;
        }
    }
}


- (IBAction)signUpDoneBtnAction:(id)sender {
    [NetworkModule signUpWithUsername:self.userNameTf.text withPassword1:self.password1Tf.text withPassword2:self.password2Tf.text completionBlock:^(BOOL isSuccess, NSDictionary *result) {
        
        if(isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);
            
            MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
            [self presentViewController:mainVC animated:YES completion:nil];
            
        } else {
            NSLog(@"%@", result);
        }
    }];
}

- (IBAction)cancelBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


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
