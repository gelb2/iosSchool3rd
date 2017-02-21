//
//  ViewController.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIColor *color1 = [UIColor colorWithRed:239/255.0 green: 150/255.0 blue: 109/255.0 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:240/255.0 green: 185/255.0 blue: 112/255.0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:152/255.0 green: 207/255.0 blue: 152/255.0 alpha:1];

    self.dataArr = @[@[@"일생", @"1992. 09. 21", @"0000. 00. 00", color1],@[@"2017년", @"2017. 01. 01", @"2017. 12. 31", color2], @[@"프로젝트 팀선정", @"2017. 02. 01", @"2017. 02. 26", color3]];

    
    [self createAndLayoutSubviews];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////////////////////////


- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)createAndLayoutSubviews {

    //Header
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    [headerView setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
    [self.view addSubview:headerView];
    
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(20, 24, 24, 24);
    leftBtn.tag = 100;
    [leftBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [leftBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:leftBtn];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 0, 30, 30);
    centerBtn.center = headerView.center;
    centerBtn.tag = 200;
    [centerBtn setTitle:@"홈" forState:UIControlStateNormal];
    [centerBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [centerBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:centerBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(headerView.frame.size.width - 50, 24, 24, 24);
    rightBtn.tag = 300;
    [rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [rightBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rightBtn];
    
    
    

    //TableView
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - headerView.frame.size.height) style:UITableViewStylePlain];
    tv.delegate = self;
    tv.dataSource = self;
    [tv setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tv];
}


//////////////////////////////

- (void)selectedBtn:(UIButton *)sender {
    
}

//////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setBackgroundColor:self.dataArr[indexPath.row][3]];
    [cell setCellDataWithName:self.dataArr[indexPath.row][0] withStartDate:self.dataArr[indexPath.row][1] withEndDate:self.dataArr[indexPath.row][2]];
    
    return cell;
}

@end
