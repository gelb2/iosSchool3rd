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

@property UITableView *tV;

@property NSInteger currentTabMenu;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentTabMenu = 0;
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
    

    

    //1. 시간 TableView
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - naviBar.frame.size.height) style:UITableViewStylePlain];
    tV.delegate = self;
    tV.dataSource = self;
    self.tV = tV;
//    [tV setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    
    //2. 커스텀 TableView

    
    
    //AddSubviews
    [self.view addSubview:tV];
    [self.view addSubview:naviBar];     // NaviBar를 맨 앞에 배치 (Shadow)
}



//// CustomUINavigationBar Button Events ////


- (void)selectedNaviBarBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}



/////////// Tab Menu Btn Click ///////////

- (void)selectedTabBtn:(UIButton *)sender {
    if (sender.tag == 0) {
        // 0. 시간
        self.currentTabMenu = 0;
        
    } else if (sender.tag == 1) {
        // 1. 커스텀
        self.currentTabMenu = 1;
        
    } else {
        // 2. 더보기
        self.currentTabMenu = 2;
        
    }
}



/////////////// UITableView ///////////////



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 각 세션의 헤더가 스크롤시 고정되있는 현상을 수정하기 위해 위치를 재조정하는 코드 추가
    
    CGFloat sectionHeaderHeight = 60;
    NSLog(@"%lf, %lf", sectionHeaderHeight, self.tV.contentOffset.y);
    if (self.tV.contentOffset.y<=sectionHeaderHeight && self.tV.contentOffset.y>=0) {
        self.tV.contentInset = UIEdgeInsetsMake(-self.tV.contentOffset.y, 0, 0, 0);
    } else if (self.tV.contentOffset.y >= sectionHeaderHeight) {
        self.tV.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //Tab View
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    UIButton *tabButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton1.frame = CGRectMake(0, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton1 setTitle:@"시간" forState:UIControlStateNormal];
    [tabButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tabButton1.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton1 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton1.tag = 0;
    [tabView addSubview:tabButton1];
    
    UIButton *tabButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton2.frame = CGRectMake(self.view.frame.size.width/3, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton2 setTitle:@"커스텀" forState:UIControlStateNormal];
    [tabButton2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton2.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton2 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton2.tag = 1;
    [tabView addSubview:tabButton2];
    
    UIButton *tabButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton3.frame = CGRectMake(self.view.frame.size.width*2/3, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton3 setTitle:@"더보기" forState:UIControlStateNormal];
    [tabButton3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton3.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton3 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton3.tag = 2;
    [tabView addSubview:tabButton3];
    
    // Selected Red Line
    UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(10, tabView.frame.size.height - 4.5, tabView.frame.size.width/3 - 20, 4)];
    [redLine setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
    [tabView addSubview:redLine];
    
    // Cell SeparatorLine
    UIView *separatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, tabView.frame.size.height - 0.5, self.view.frame.size.width, 0.5)];
    [separatorLine setBackgroundColor:[UIColor lightGrayColor]];
    [tabView addSubview:separatorLine];
    
    return tabView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (AddTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[AddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    switch (indexPath.row) {
        case TITLE:
            [cell setCellType:TITLE];
            break;
        case DATE:
            [cell setCellType:DATE];
            break;
        default:
            break;
    }
    
    
    return cell;
}

@end
