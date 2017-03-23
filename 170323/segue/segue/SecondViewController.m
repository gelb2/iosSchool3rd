//
//  SecondViewController.m
//  segue
//
//  Created by Jeheon Choi on 2017. 3. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"SecondViewController";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.label.text = [NSString stringWithFormat:@"Second\n%@\n%ld", [self.navigationController viewControllers], [self.navigationController viewControllers].count];
}

- (IBAction)manualSegue:(id)sender {
    [self performSegueWithIdentifier:@"two2first" sender:self];
}

- (IBAction)mySecondUnwindAction:(UIStoryboardSegue *)sender {
    NSLog(@"myUnwindAction : second VC");
}


@end
