//
//  BlogSearchViewController.m
//  RealmSearch
//
//  Created by Jeheon Choi on 2017. 4. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//
// https://realm.io/kr/news/building-an-ios-search-controller-in-objective-c/

#import "BlogSearchViewController.h"
#import "BlogObject.h"
#import "BlogPostTableViewCell.h"

@interface BlogSearchViewController ()

@end

@implementation BlogSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Blogs";
    self.tableView.estimatedRowHeight = 88.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"BlogPostTableViewCell" bundle:nil] forCellReuseIdentifier:@"blogCell"];
}


#pragma mark - ABFRealmSearchControllerDataSource

- (UITableViewCell *)searchViewController:(ABFRealmSearchViewController *)searchViewController
                            cellForObject:(id)anObject
                              atIndexPath:(NSIndexPath *)indexPath
{
    BlogPostTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"blogCell" forIndexPath:indexPath];
    BlogObject *blog = anObject;
    
    cell.titleLabel.text = [blog.title capitalizedString];
    cell.emojiLabel.text = blog.emoji;
    cell.contentLabel.text = blog.content;
    
    return cell;
}

@end
