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

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Main VC viewDidLoad");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//----------------- UIButton 관련 -----------------//

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
