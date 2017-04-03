//
//  ViewController.m
//  UISearch
//
//  Created by Jeheon Choi on 2017. 3. 24..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = @[@"최제헌", @"정한선", @"박종찬", @"조백진", @"최원석", @"조봉기", @"박찬웅", @"주영민", @"김윤서"];
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    searchController.hidesNavigationBarDuringPresentation = NO;
    searchController.searchBar.delegate        = self;
    searchController.searchResultsUpdater      = self;
    searchController.searchBar.backgroundImage = [UIImage new];
    searchController.searchBar.tintColor       = [UIColor colorWithRed:0/255.0f
                                                                 green:122/255.0f
                                                                  blue:255/255.0f
                                                                 alpha:1];
    
    self.searchController = searchController;

    self.tableView.tableHeaderView = searchController.searchBar;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}


#pragma mark - UISearchController Delegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
}



@end
