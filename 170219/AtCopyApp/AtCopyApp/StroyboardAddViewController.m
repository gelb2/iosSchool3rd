//
//  StroyboardAddViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 27..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "StroyboardAddViewController.h"

@interface StroyboardAddViewController ()

@end

@implementation StroyboardAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.testView setBackgroundColor:[UIColor blueColor]];
}


- (IBAction)btnAction:(UIButton *)sender {
    self.textLB.text = @"버튼 눌림";
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
