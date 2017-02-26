//
//  MenuViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "MenuViewController.h"
#import "CustomUINavigationBar.h"

@interface MenuViewController ()
<CustomUINavigationBarDelegate>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createAndLayoutSubviews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/////////////// UI Setting ///////////////

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)createAndLayoutSubviews {
    
    //Custom NavigationBar
    CustomUINavigationBar *naviBar = [[CustomUINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75) withType:MENU];
    naviBar.delegate = self;
    
    //AddSubviews
    [self.view addSubview:naviBar];     // NaviBar를 맨 앞에 배치 (Shadow)
    
}



//// CustomUINavigationBar Button Events ////

- (void)selectedNaviBarBackBtn {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:@"Choi"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
