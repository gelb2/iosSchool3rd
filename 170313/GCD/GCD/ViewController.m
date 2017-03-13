//
//  ViewController.m
//  GCD
//
//  Created by Jeheon Choi on 2017. 3. 13..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    
    [self.timerBtn setSelected:!self.timerBtn.selected];
    
    if (self.timerBtn.selected) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSInteger i = 0;
            while (self.timerBtn.selected) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.numberLabel setText:[NSString stringWithFormat:@"%ld", i]];
                });
                sleep(1);
                i++;
            }
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.numberLabel setText:@"0"];
        });
    }
}

@end
