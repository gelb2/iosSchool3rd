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
<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate>

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
    
    //Tab View
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, 60)];
    
    UIButton *tabButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton1.frame = CGRectMake(0, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton1 setTitle:@"시간" forState:UIControlStateNormal];
    [tabButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tabButton1.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton1 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton1.tag = 1;
    [tabView addSubview:tabButton1];
    
    UIButton *tabButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton2.frame = CGRectMake(self.view.frame.size.width/3, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton2 setTitle:@"커스텀" forState:UIControlStateNormal];
    [tabButton2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton2.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton2 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton2.tag = 2;
    [tabView addSubview:tabButton2];
    
    UIButton *tabButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton3.frame = CGRectMake(self.view.frame.size.width*2/3, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton3 setTitle:@"더보기" forState:UIControlStateNormal];
    [tabButton3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton3.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton3 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton3.tag = 3;
    [tabView addSubview:tabButton3];
    
    // Selected Red Line
    UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(10, tabView.frame.size.height - 4.5, tabView.frame.size.width/3 - 20, 4)];
    [redLine setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
    [tabView addSubview:redLine];
    
    // Cell SeparatorLine
    UIView *separatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, tabView.frame.size.height - 0.5, self.view.frame.size.width, 0.5)];
    [separatorLine setBackgroundColor:[UIColor lightGrayColor]];
    [tabView addSubview:separatorLine];

    //ScrollView
    UIScrollView *sV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height + tabButton1.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - naviBar.frame.size.height - tabButton1.frame.size.height)];
    [sV setPagingEnabled:YES];
    [sV setContentSize:CGSizeMake(sV.frame.size.width * 2, sV.frame.size.height)];
    sV.delegate = self;

    //1. 시간 TableView
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, sV.frame.size.width, sV.frame.size.height) style:UITableViewStylePlain];
    tV.delegate = self;
    tV.dataSource = self;
//    [tV setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    [sV addSubview:tV];
    
    
    //AddSubviews
    [self.view addSubview:tabView];
    [self.view addSubview:sV];
    [self.view addSubview:naviBar];     // NaviBar를 맨 앞에 배치 (Shadow)
}



//// CustomUINavigationBar Button Events ////


- (void)selectedNaviBarBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}



/////////// Tab Menu Btn Click ///////////

- (void)selectedTabBtn:(UIButton *)sender {
    if (sender.tag == 1) {
        // 1. 시간
        
    } else if (sender.tag == 2) {
        // 2. 커스텀
        
    } else {
        // 3. 더보기
        
    }
}



/////////////// UITableView ///////////////

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    
    
    
    return headerView;
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
