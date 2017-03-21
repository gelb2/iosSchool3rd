//
//  MainViewController.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "MainViewController.h"
#import "NetworkModule.h"
#import "DataCenter.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *img;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Main VC viewDidLoad");
    
    [self initialSetting];
    
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:@"https://media.giphy.com/media/OazoCyXHeGyDm/giphy.gif"]
                placeholderImage:[UIImage imageNamed:@"o_o.gif"]
                         options:SDWebImageLowPriority];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"mainView VC viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"mainView VC viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"mainView VC viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"mainView VC viewDidDisappear");
}

//----------------- 초기 세팅 관련 -----------------//
#pragma mark - 초기 세팅 관련

- (void)initialSetting {
    self.indicatorView.layer.cornerRadius = 5;
}

//----------------- UIButton 관련 -----------------//
#pragma mark - UIButton 관련

- (IBAction)logOutBtnAction:(id)sender {
    
    [self.indicator startAnimating];
    [self.indicatorView setHidden:NO];
    
    [NetworkModule logOutWithCompletionBlock:^(BOOL isSuccess, NSDictionary *result) {

        if(isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
        
                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];
                [self dismissViewControllerAnimated:YES completion:nil];
            });
            
        } else {
            NSLog(@"%@", [result objectForKey:@"non_field_errors"]);
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [self.indicatorView setHidden:YES];
                [self.indicator stopAnimating];

            });
        }
    }];
    
}

@end
