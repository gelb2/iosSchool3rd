//
//  ViewController.m
//  TextField
//
//  Created by Jeheon Choi on 2017. 2. 6..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomTF *tf1 = [[CustomTF alloc] initWithCentor:CGPointMake(self.view.center.x, self.view.center.y) withFrame:CGRectMake(0, 0, 150, 35)];
    [self.view addSubview:tf1];
    

    
//    CustomTF *tf2 = [[CustomTF alloc] initWithCentor:CGPointMake(self.view.center.x, self.view.center.y) withFrame:CGRectMake(0, 0, 150, 35)];
//    [self.view addSubview:tf2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
