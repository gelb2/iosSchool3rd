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
    
    UIColor *color1 = [UIColor colorWithRed:239/255.0 green: 150/255.0 blue: 109/255.0 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:240/255.0 green: 185/255.0 blue: 112/255.0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:152/255.0 green: 207/255.0 blue: 152/255.0 alpha:1];

    self.dataArr = @[@[@"일생", @"1992. 09. 21", @"0000. 00. 00", color1],@[@"2017년", @"2017. 01. 01", @"2017. 12. 31", color2], @[@"프로젝트 팀선정", @"2017. 02. 01", @"2017. 02. 26", color3]];
    
    UITableView *tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tv.delegate = self;
    tv.dataSource = self;
    [tv setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tv];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

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
