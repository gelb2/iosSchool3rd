//
//  ViewController.m
//  UIPageControl
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>

@property UIScrollView *scrollView;
@property UIPageControl *pgControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // UIScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height)];
    [self.scrollView setPagingEnabled:YES];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    
    
    // Background colors set
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [view1 setBackgroundColor:[UIColor purpleColor]];
    [self.scrollView addSubview:view1];
   
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [view2 setBackgroundColor:[UIColor brownColor]];
    [self.scrollView addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [view3 setBackgroundColor:[UIColor orangeColor]];
    [self.scrollView addSubview:view3];
    
    
    
    // UIPageControl
//    self.pgControl = [[UIPageControl alloc] init];
    self.pgControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
//    self.pgControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];   // 화면 전체 절반 좌우로 한칸씩 이동 // 이건 스크롤뷰 덮임..
    [self.pgControl setCenter:CGPointMake(self.view.center.x, self.view.center.y)];
    [self.pgControl setNumberOfPages:3];
    [self.pgControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [self.pgControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    [self.view addSubview:self.pgControl];
    [self.pgControl addTarget:self action:@selector(didSelectedPageIndicator:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)didSelectedPageIndicator:(UIPageControl *)sender
{
    NSLog(@"didSelectedPageIndicator");
    if ([sender currentPage] == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:true];
    } else if (sender.currentPage == 1) {
        [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:true];
    } else if ([sender currentPage] == 2) {
        [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 2, 0) animated:true];
    }
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
    if((*targetContentOffset).x == 0) {
        [self.pgControl setCurrentPage:0];
    } else if ((*targetContentOffset).x == self.view.frame.size.width) {
        [self.pgControl setCurrentPage:1];
    } else if ((*targetContentOffset).x == self.view.frame.size.width * 2) {
        [self.pgControl setCurrentPage:2];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

