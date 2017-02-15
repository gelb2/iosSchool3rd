//
//  ViewController.m
//  AnimalUITableView
//
//  Created by Jeheon Choi on 2017. 2. 15..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property NSArray *list;
@property NSArray *normalList;
@property NSArray *rareList;
@property NSArray *heroList;
@property NSArray *legendList;
@property UITableView *tv;

@property UILabel *sectionLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.normalList = @[@"기사", @"아처", @"폭탄병"];
    self.rareList = @[@"미니 P.E.K.K.A", @"머스킷병", @"자이언트", @"발키리", @"호그 라이더", @"마법사"];
    self.heroList = @[@"프린스", @"베이비 드래곤", @"해골 군대"];
    self.legendList = @[@"라바 하운드", @"인페르노 드래곤", @"얼음 마법사"];
    self.list = @[self.normalList, self.rareList, self.heroList, self.legendList];
    
    NSLog(@"%@", self.normalList);
    
    
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    self.tv.dataSource = self;
    self.tv.delegate = self;
    [self.view addSubview:self.tv];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


// Override
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(0, 8, self.view.frame.size.width, 25);
    myLabel.font = [UIFont boldSystemFontOfSize:18];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    [myLabel setTextAlignment:NSTextAlignmentCenter];
    [myLabel setBackgroundColor:[UIColor whiteColor]];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, myLabel.frame.size.height + 10, myLabel.frame.size.width, 2)];
    [bottomLine setBackgroundColor:[UIColor lightGrayColor]];
    [myLabel addSubview:bottomLine];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [headerView addSubview:myLabel];
    [headerView addSubview:bottomLine];
    
    return headerView;
}


- tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case SectionNormal:
            return @"일반 카드";
        case SectionRare:
            return @"희귀 카드";
        case SectionHero:
            return @"영웅 카드";
        case SectionLegend:
            return @"전설 카드";
        default:
            return @"";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"";
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case SectionNormal:
            return self.normalList.count;
        case SectionRare:
            return self.rareList.count;
        case SectionHero:
            return self.heroList.count;
        case SectionLegend:
            return self.legendList.count;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:self.list[indexPath.section][indexPath.row]];
    
    switch (indexPath.section) {
        case SectionNormal:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/normalUnit%ld.png", indexPath.row]]];
            break;
        case SectionRare:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/rareUnit%ld.png", indexPath.row]]];
            break;
        case SectionHero:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/heroUnit%ld.png", indexPath.row]]];
            break;
        case SectionLegend:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/legendUnit%ld.png", indexPath.row]]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}





@end
