//
//  AddViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AddViewController.h"
#import "CustomUINavigationBar.h"
#import "TabView.h"
#import "AddTableViewCell.h"
#import "DataCenter.h"

#define TAB_MENU_HEIGHT 60

@interface AddViewController ()
<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate, TabViewDelegate>


@property NSInteger currentAddVer;

@property UITableView *tV;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentAddVer = ADD1;         // ADD ArrayData를 최초로 사용할 때, ADD1 case
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
    [tV setSeparatorInset:UIEdgeInsetsZero];
//    tV.tableFooterView = [[UIView alloc] init];     //Plain style에서 불필요한 Separator 안나오게 함
    
    
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
        self.currentAddVer = ADD1;
        
    } else if (sender.tag == 1) {
        // 1. 커스텀
        self.currentAddVer = CUSTOM;
        
    } else {
        // 2. 더보기
        self.currentAddVer = MORE;
        
    }
}



/////////////// UITableView ///////////////


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return TAB_MENU_HEIGHT;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 각 세션의 헤더가 스크롤시 고정되있는 현상을 수정하기 위해 위치를 재조정하는 코드 추가
    
    CGFloat sectionHeaderHeight = TAB_MENU_HEIGHT;   //self.tV.sectionHeaderHeight X
//    NSLog(@"%lf, %lf", sectionHeaderHeight, self.tV.contentOffset.y);
    if (self.tV.contentOffset.y<=sectionHeaderHeight && self.tV.contentOffset.y>=0) {
        self.tV.contentInset = UIEdgeInsetsMake(-self.tV.contentOffset.y, 0, 0, 0);
    } else if (self.tV.contentOffset.y >= sectionHeaderHeight) {
        self.tV.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // Tab View
    TabView *tabView = [[TabView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TAB_MENU_HEIGHT)];
    tabView.delegate = self;

    return tabView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[DataCenter sharedInstance].addArrData[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [DataCenter getAddCellHeight:[DataCenter sharedInstance].addArrData[self.currentAddVer][indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellStr = [DataCenter sharedInstance].addArrData[self.currentAddVer][indexPath.row];
        
    // 두 글자만 비교
    if ([[cellStr substringToIndex:2] isEqualToString:@"DE"]) {
        
        // 기본 테이블뷰 셀
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];     // 선택시 Highlighted 되는거 해제
            
            // Switch 기본 설정
            UISwitch *switcher = [[UISwitch alloc] init];
            [switcher setOnTintColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
            [switcher addTarget:self action:@selector(selectedSwitcher:) forControlEvents:UIControlEventValueChanged];
            
            [cell setAccessoryView:switcher];
            
            switch ([DataCenter addCellTypeStr2Num:cellStr]) {
                case DEFAULTINFO2:
                    cell.textLabel.text = @"배지 설정";
                    switcher.tag = 3;   // 배지 설정 : 3
                    break;
                    
                case DEFAULTINFO1:
                    cell.textLabel.text = @"위젯 설정";
                    switcher.tag = 2;   // 위젯 설정 : 2
                    [switcher setOn:YES];       // 초기 세팅 On
                    break;
                    
                case DEFAULT2:
                    cell.textLabel.text = @"반복 설정";
                    switcher.tag = 1;   // 반복 설정 : 1
                    break;
                    
                default:    //DEFAULT
                    cell.textLabel.text = @"기간으로 설정";
                    switcher.tag = 0;   // 기간으로 설정 : 0
                    break;
            }
        
            // Text 기본 설정
            [cell.textLabel setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:20]];
            
        }
        
        return cell;
        
    } else {
        // 커스텀 테이블뷰 셀
        AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell = [[AddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
        }
        
        return cell;
    }
}

////////////// Tab View //////////////

- (void)selectedTabViewLeftBtn:(UIButton *)btn {
    
}

- (void)selectedTabViewMiddleBtn:(UIButton *)btn {
    
}

- (void)selectedTabViewRightBtn:(UIButton *)btn {
    
}



////////////// Switch Click //////////////

- (void)selectedSwitcher:(UISwitch *)switcher {
    NSLog(@"스위치 누름");
    if (switcher.tag == 0) {
        self.currentAddVer = switcher.on ? ADD2 : ADD1;
        [self.tV reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}



@end
