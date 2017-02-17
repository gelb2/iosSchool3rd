//
//  ViewController.m
//  UITableView4
//
//  Created by Jeheon Choi on 2017. 2. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property DataCenter *dataCenter;
@property UITableView *tv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataCenter = [[DataCenter alloc] init];
    
    self.tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    [self.view addSubview:self.tv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataCenter sectionCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataCenter sectionTitles][section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [self.dataCenter allAnimals][[self.dataCenter sectionTitles][section]];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tv dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSLog(@"%@", [self.dataCenter sectionTitles][indexPath.section]);
    
    cell.textLabel.text = [self.dataCenter allAnimals][[self.dataCenter sectionTitles][indexPath.section]][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.dataCenter imageNameWithAnimal:cell.textLabel.text]];
    
    return cell;
}


@end
