//
//  SecondViewController.m
//  UINavigationController
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [nextBtn setCenter:self.view.center];
    [nextBtn addTarget:self action:@selector(onSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"BackStep" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:nextBtn];
}

- (void)onSelectedBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
