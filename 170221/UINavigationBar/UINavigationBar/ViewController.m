//
//  ViewController.m
//  UINavigationBar
//
//  Created by Jeheon Choi on 2017. 2. 21..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"Navi";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.0 green:121/255.0 blue:191/255.0 alpha:1]];
    
    UIButton *menu = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    [menu setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:menu];
    self.navigationItem.leftBarButtonItem = item;
    
    UIButton *add = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    [add setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [add addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    item = [[UIBarButtonItem alloc] initWithCustomView:add];
    self.navigationItem.rightBarButtonItem = item;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)menuBtnClick:(UIButton *)sender {
    
}

- (void)addBtnClick:(UIButton *)sender {
    SecondViewController *sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:sVC animated:YES];
}


@end
