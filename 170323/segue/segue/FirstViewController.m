//
//  FirstViewController.m
//  segue
//
//  Created by Jeheon Choi on 2017. 3. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"FirstViewController";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.label.text = [NSString stringWithFormat:@"First\n%@\n%ld", [self.navigationController viewControllers], [self.navigationController viewControllers].count];
}

- (IBAction)myUnwindAction:(UIStoryboardSegue *)sender {
    NSLog(@"myUnwindAction : first VC");
}


- (IBAction)manualSegue:(id)sender {
    
    [self performSegueWithIdentifier:@"first2second" sender:self];
}


//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    
//    NSLog(@"못 넘어가!");
//    
//    return NO;
//}


@end
