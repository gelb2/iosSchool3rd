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

@interface LoginViewController () <logInDelegate>

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [DataCenter sharedInstance].logInDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpBtnAction:(id)sender {
}

- (IBAction)logInBtnAction:(id)sender {
    
    [NetworkModule logInWithUsername:self.userNameTf.text withPassword:self.passwordTf.text];

}

- (void)logInStart {
    
    if ([DataCenter sharedInstance].token != NULL) {
        MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self presentViewController:mainVC animated:YES completion:nil];
    }
}


@end
