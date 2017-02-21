//
//  ViewController.m
//  UIViewController
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "XecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [nextBtn setCenter:self.view.center];
    [nextBtn addTarget:self action:@selector(onSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"NextStep" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:nextBtn];
}

- (void)onSelectedBtn:(UIButton *)sender {

    //다음 페이지로 이동
    //********스토리 보드 사용법********//
//    //1. 스토리보드 객체 만들기
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    //2. 뷰컨트롤러 객체 만들기
//    SecondViewController *sVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    //1&2
    SecondViewController *sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    

    //********XIB 사용법********//
//    XecondViewController *xVC = [[XecondViewController alloc] initWithNibName:@"XecondViewController" bundle:[NSBundle mainBundle]];
    XecondViewController *xVC = [[XecondViewController alloc] init];
    
    
    //3. 페이지 전환
    [self presentViewController:xVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
