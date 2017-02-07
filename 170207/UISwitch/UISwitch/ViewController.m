//
//  ViewController.m
//  UISwitch
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UISwitch *uiSwitch;
@property UILabel *uiLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    // UISwitch
    self.uiSwitch = [[UISwitch alloc] init];
//    self.uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.uiSwitch setCenter:self.view.center];
    [self.view addSubview:self.uiSwitch];

    [self.uiSwitch addTarget:self action:@selector(didSelectedSwitch:) forControlEvents:UIControlEventValueChanged];
    
    
    // UILabel
    self.uiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.uiLabel setText:@"OFF"];
    [self.uiLabel setCenter:CGPointMake(self.view.center.x, self.view.center.y - 50)];
    [self.uiLabel setFont:[UIFont boldSystemFontOfSize:22]];
    [self.uiLabel setTextColor:[UIColor blackColor]];
    [self.uiLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.uiLabel];

}

- (void)didSelectedSwitch:(UISwitch *)sender
{
    if ([self.uiSwitch isOn] == YES) {
        [self.uiLabel setText:@"ON"];
    } else {
        [self.uiLabel setText:@"OFF"];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
