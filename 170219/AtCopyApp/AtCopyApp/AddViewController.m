//
//  AddViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AddViewController.h"
#import "CustomUINavigationBar.h"
#import "AddTableViewCell.h"

@interface AddViewController ()
<UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate>

@end

@implementation AddViewController

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
    CustomUINavigationBar *naviBar = [[CustomUINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75) withType:ADD];
    naviBar.delegate = self;

    //TableView
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - naviBar.frame.size.height) style:UITableViewStyleGrouped];
    tV.delegate = self;
    tV.dataSource = self;
//    [tV setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    
    
    //AddSubviews
    [self.view addSubview:tV];
    [self.view addSubview:naviBar];
}



//// CustomUINavigationBar Button Events ////


- (void)selectedNaviBarBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}



/////////////// UITableView ///////////////

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    
    
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 75;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"Hahahaha";
    
    UISwitch *switcher = [[UISwitch alloc] init];
    switcher.tag = indexPath.row;
    [switcher addTarget:self action:@selector(selectedSwitch:) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = switcher;
    
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"Switch%ld",switcher.tag]]) {
        switcher.on = [[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"Switch%ld",switcher.tag]];
    }
    
    return cell;
}

- (void)selectedSwitch:(UISwitch *)sender {    
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:[NSString stringWithFormat:@"Switch%ld", sender.tag]];
}


@end
