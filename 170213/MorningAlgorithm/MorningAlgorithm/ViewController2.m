//
//  ViewController2.m
//  MorningAlgorithm
//
//  Created by Jeheon Choi on 2017. 2. 13..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    NSLog(@"viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
