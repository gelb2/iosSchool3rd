//
//  ViewController.m
//  LoginPage
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<LoginViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGPoint center = self.view.center;
    CGRect loginTFFrame = CGRectMake(center.x - 150, center.y - 100, 300, 250);
    
    
    // Background & Logo Views
    [self.view setBackgroundColor:[UIColor colorWithRed:233/255.0 green:1 blue:217/255.0 alpha:1]];

    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pokemon_go_logo.png"]];
    [logoView setFrame:CGRectMake(center.x - 60, 85, 120, 120)];
    [logoView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:logoView];
    


    // Add Login Views
    LoginView *loginView = [[LoginView alloc] initWithFrame:loginTFFrame];
    [self.view addSubview:loginView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
