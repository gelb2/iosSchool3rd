//
//  ViewController.m
//  UINavigationController
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [nextBtn setCenter:self.view.center];
    [nextBtn addTarget:self action:@selector(onSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"NextStep" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:nextBtn];
}

- (void)onSelectedBtn:(UIButton *)sender {
//    SecondViewController *sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    SecondViewController *sVC = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:sVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
