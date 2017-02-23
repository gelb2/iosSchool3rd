//
//  UIHomeViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomUINavigationBar.h"
#import "HomeTableViewCell.h"
#import "AddViewController.h"
#import "MenuViewController.h"

@interface HomeViewController ()
<UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate>

@property (nonatomic) NSArray *dataArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden:YES];
    
    UIColor *color1 = [UIColor colorWithRed:239/255.0 green: 150/255.0 blue: 109/255.0 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:240/255.0 green: 185/255.0 blue: 112/255.0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:152/255.0 green: 207/255.0 blue: 152/255.0 alpha:1];
    
    self.dataArr = @[@[@"일생", @"1992. 09. 21", @"0000. 00. 00", color1],
                     @[@"2017년", @"2017. 01. 01", @"2017. 12. 31", color2],
                     @[@"프로젝트 팀선정", @"2017. 02. 01", @"2017. 02. 26", color3]];
    
    
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
    CustomUINavigationBar *naviBar = [[CustomUINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75) withType:HOME];
    naviBar.delegate = self;
    
    //TableView
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - naviBar.frame.size.height) style:UITableViewStylePlain];
    tV.delegate = self;
    tV.dataSource = self;
    [tV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    //AddSubviews
    [self.view addSubview:tV];
    [self.view addSubview:naviBar];
}


//// CustomUINavigationBar Button Events ////

- (void)selectedNaviBarMenuBtn {
    MenuViewController *menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    [self.navigationController.topViewController presentViewController:menuVC animated:YES completion:nil];
}

- (void)selectedNaviBarAddBtn {
    AddViewController *addVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    [self.navigationController pushViewController:addVC animated:YES];
}


/////////////// UITableView ///////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setBackgroundColor:self.dataArr[indexPath.row][3]];
    [cell setCellDataWithName:self.dataArr[indexPath.row][0] withStartDate:self.dataArr[indexPath.row][1] withEndDate:self.dataArr[indexPath.row][2]];
    
    return cell;
}

@end
