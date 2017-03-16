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


@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIView *signUpView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *password1Tf;
@property (weak, nonatomic) IBOutlet UITextField *password2Tf;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpDoneBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [NetworkModule signUpWithUsername:self.userNameTf.text withPassword1:self.password1Tf.text withPassword2:self.password2Tf.text];
    }];
}

- (IBAction)cancelBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
