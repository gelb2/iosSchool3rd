//
//  ThirdViewController.m
//  segue
//
//  Created by Jeheon Choi on 2017. 3. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"ThirdViewController";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.label.text = [NSString stringWithFormat:@"Third\n%@\n%ld", [self.navigationController viewControllers], [self.navigationController viewControllers].count];
}


- (IBAction)manualSegue:(id)sender {
    
    [self performSegueWithIdentifier:@"third2two" sender:self];
}

- (IBAction)myThirdUnwindAction:(UIStoryboardSegue *)sender {
    NSLog(@"myUnwindAction : third VC");
}



@end
