//
//  ViewController.m
//  CustomUIView
//
//  Created by Jeheon Choi on 2017. 2. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomView.h"
#import "MyCustomTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    MyCustomView *customView = [[MyCustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
//    [self.view addSubview:customView];
//    [customView setDataWithIMGName:@"twice.jpeg" name:@"Twice" msg:@"이렇게 커스텀 메세지를 넣을 수 있으니 얼마나 좋아요~~~~포켓고!"];
    
    UITableView *tv = [[UITableView alloc] initWithFrame:self.view.bounds];
    tv.delegate = self;
    tv.dataSource = self;
    [self.view addSubview:tv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell setDataWithIMGName:@"twice.jpeg" name:@"Twice" msg:@"이렇게 커스텀 메세지를 넣을 수 있으니 얼마나 좋아요~~~~포켓고!"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

@end
