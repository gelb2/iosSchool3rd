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
#import "DataCenter.h"

#define CELL_SIZE 125.f


@interface HomeViewController ()
<UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate>

@property (nonatomic) NSArray *dataArr;
@property (nonatomic) NSArray *cellColor;

@property UITableView *tV;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"noti" object:nil];

    
    [self.navigationController.navigationBar setHidden:YES];
    
    self.cellColor = [DataCenter sharedInstance].cellColor;
    
    
    self.dataArr = @[@[@"일생", @"1992. 09. 21", @"0000. 00. 00"],
                     @[@"2017년", @"2017. 01. 01", @"2017. 12. 31"],
                     @[@"기간 테스트", @"2016. 11. 01", @"2017. 12. 31"],
                     @[@"프로젝트 팀선정", @"2017. 02. 01", @"2017. 02. 26"],
                     @[@"기간버전 종료일 초과", @"2016. 02. 28", @"2016. 11. 12"],
                     @[@"그제부터(17.02.27기준)", @"2017. 02. 25", @"0000. 00. 00"],
                     @[@"어제부터(17.02.27기준)", @"2017. 02. 26", @"0000. 00. 00"],
                     @[@"오늘부터(17.02.27기준)", @"2017. 02. 27", @"0000. 00. 00"],
                     @[@"내일부터(17.02.27기준)", @"2017. 02. 28", @"0000. 00. 00"],
                     @[@"모레부터(17.02.27기준)", @"2017. 03. 01", @"0000. 00. 00"],
                     @[@"입학", @"2011. 03. 02", @"0000. 00. 00"],
                     @[@"음 뭘 적을까? Zzz", @"2017. 04. 01", @"2017. 05. 24"],
                     @[@"음하하하", @"2017. 02. 01", @"2017. 11. 01"]];
    
    
    [self createAndLayoutSubviews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 기기에서는 잘되는데, 시뮬레이터에서는 초기 애니메이션 안보일 때가 많음..;;
//    NSLog(@"viewWillAppear");
    for (HomeTableViewCell *cell in self.tV.visibleCells) {
        [cell statusBarAnimationStart];
    }
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/////////////// UI Setting ///////////////

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)createAndLayoutSubviews {
    
    //Custom NavigationBar
    CustomUINavigationBar *naviBar = [[CustomUINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, CELL_SIZE/2) withType:HOME];
    naviBar.delegate = self;
    
    //TableView
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - naviBar.frame.size.height) style:UITableViewStylePlain];
    tV.delegate = self;
    tV.dataSource = self;
    [tV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [tV setSeparatorInset:UIEdgeInsetsZero];
//    [tV setSeparatorColor:[UIColor whiteColor]];
//    tV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tV = tV;
    
    //AddSubviews
    [self.view addSubview:tV];
    [self.view addSubview:naviBar];     // NaviBar를 맨 앞에 배치 (Shadow)
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
    return CELL_SIZE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setBackgroundColor:self.cellColor[indexPath.row % self.cellColor.count]];
    [cell setCellDataWithName:self.dataArr[indexPath.row][0] withStartDate:self.dataArr[indexPath.row][1] withEndDate:self.dataArr[indexPath.row][2]];

    [cell statusBarAnimationStart];     // layoutSubviews와 여기 둘 다 넣어줘야 초기 애니메이션 잘 작동 됨 (?)
    
    return cell;
}

///////////////////////////////////////////


- (void)notification:(NSNotification *)noti {
    NSLog(@"%@", noti.object);
}

@end
