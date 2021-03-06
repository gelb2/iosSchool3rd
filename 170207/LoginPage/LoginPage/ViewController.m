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

@property UIScrollView *backgroundScrollView;
@property NSString *ID;
@property NSString *PW;

@property LoginView *loginView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGPoint center = self.view.center;
    CGRect loginTFFrame = CGRectMake(center.x - 150, center.y - 100, 300, 250);
    
    self.ID = @"abc";
    self.PW = @"123";
    
    // Background Scroll View
    self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.backgroundScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2)];
    [self.backgroundScrollView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:1 blue:217/255.0 alpha:1]];
    [self.backgroundScrollView setScrollEnabled:NO];
    [self.view addSubview:self.backgroundScrollView];
    
    // Logo img View
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pokemon_go_logo.png"]];
    [logoView setFrame:CGRectMake(center.x - 60, 85, 120, 120)];
    [logoView setContentMode:UIViewContentModeScaleAspectFill];
    [self.backgroundScrollView addSubview:logoView];
    
    // Add Login Views
    self.loginView = [[LoginView alloc] initWithFrame:loginTFFrame];
    self.loginView.delegate = self;
    [self.backgroundScrollView addSubview:self.loginView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)selectedLoginBtnWithID:(NSString *)ID withPW:(NSString *)PW
{
    if ([self.ID isEqualToString:ID] && [self.PW isEqualToString:PW]) {
        [self.backgroundScrollView setContentOffset:CGPointMake(0, self.view.frame.size.height) animated:YES];
        NSLog(@"로그인 성공");
        return YES;
    }
    NSLog(@"로그인 실패");
    return NO;
}


@end
