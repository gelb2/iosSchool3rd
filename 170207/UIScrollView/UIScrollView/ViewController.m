//
//  ViewController.m
//  UIScrollView
//
//  Created by Jeheon Choi on 2017. 2. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
<UIScrollViewDelegate>

@property UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = self.view.frame.size;

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height)];
    [self.scrollView setContentSize:CGSizeMake(frameSize.width*3, frameSize.height)];
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    
    [self makeImgViewWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height) withColor:[UIColor blueColor]];
    [self makeImgViewWithFrame:CGRectMake(frameSize.width * 1, 0, frameSize.width, frameSize.height) withColor:[UIColor greenColor]];
    [self makeImgViewWithFrame:CGRectMake(frameSize.width * 2, 0, frameSize.width, frameSize.height) withColor:[UIColor redColor]];
    
}

- (void)makeImgViewWithFrame:(CGRect)frame withColor:(UIColor *)color
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    [imgView setImage:[UIImage imageNamed:@""]];
    [imgView setBackgroundColor:color];
    [self.scrollView addSubview:imgView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
