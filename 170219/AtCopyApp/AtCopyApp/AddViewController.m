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
#import "DataCenter.h"

#define TAB_MENU_HEIGHT 60

@interface AddViewController ()
<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, CustomUINavigationBarDelegate>


@property NSInteger currentAddVer;

@property UITableView *tV;
@property (nonatomic, weak) UISwitch *switcher;

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
    //Tab View
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TAB_MENU_HEIGHT)];
    
    UIButton *tabButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton1.frame = CGRectMake(0, 0, self.view.frame.size.width/3, tabView.frame.size.height);
    [tabButton1 setTitle:@"시간" forState:UIControlStateNormal];
    [tabButton1 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
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
            self.switcher = switcher;
            [cell setAccessoryView:switcher];
            
            switch ([DataCenter addCellTypeStr2Num:cellStr]) {
                case DEFAULTINFO:
                    // 일단 레이아웃 짜기 위해 아래같은 수식 씀
                    if (indexPath.row == 4) {
                        cell.textLabel.text = @"위젯 설정";
                        switcher.tag = 2; // 위젯 설정 : 2
                        [switcher setOn:YES];
                    } else {
                        cell.textLabel.text = @"배지 설정";
                        switcher.tag = 3; // 배지 설정 : 3
                    }
                    
                    break;
                    
                case DEFAULT2:
                    cell.textLabel.text = @"반복 설정";
                    switcher.tag = 1; // 반복 설정 : 1
                    break;
                    
                default:    //DEFAULT
                    cell.textLabel.text = @"기간으로 설정";
                    switcher.tag = 0; // 기간으로 설정 : 0
                    
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


////////////// Switch Click //////////////

- (void)selectedSwitcher:(UISwitch *)switcher {
    NSLog(@"스위치 누름");
    if (switcher.tag == 0) {
        self.currentAddVer = switcher.on ? ADD2 : ADD1;
        [self.tV reloadData];
    }
}



@end
