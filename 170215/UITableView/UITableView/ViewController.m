//
//  ViewController.m
//  UITableView
//
//  Created by Jeheon Choi on 2017. 2. 15..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (weak) UITableView *tv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UITableView *tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tv = tv;
    tv.dataSource = self;
    tv.delegate = self;
    [self.view addSubview:tv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 10;
            break;
        case 1:
            return 5;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 이렇게 짤 경우 객체 계속 생성함.
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    // 이렇게 해야 만든 cell 객체 계속해서 Reuse 가능
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]; // Frame은 테이블뷰가 알아서 맞춰주므로, Frame 설정 의미가 없음
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"row : %ld",indexPath.row]];
    
    NSLog(@"%ld", indexPath.row);
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"section1";
            break;
        case 1:
            return @"section2";
            break;
        case 2:
            return @"section3";
            break;
        default:
            return @"";
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



@end
