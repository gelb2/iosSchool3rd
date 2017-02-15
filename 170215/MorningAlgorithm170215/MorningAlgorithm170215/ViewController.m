//
//  ViewController.m
//  MorningAlgorithm170215
//
//  Created by Jeheon Choi on 2017. 2. 15..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property (weak) UITextField *tf;
@property (weak) UILabel *lb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self factorsSumWithNum:12];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    [tf setBorderStyle:UITextBorderStyleRoundedRect];
    [tf setPlaceholder:@"0 이상의 정수를 입력해주세요."];
    self.tf = tf;
    [self.view addSubview:tf];
    tf.delegate = self;
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, self.view.frame.size.width - 100, 40)];
    self.lb = lb;
    [self.view addSubview:lb];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)factorsSumWithNum:(NSInteger)num {
    NSInteger sum = 0;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 1; i <= num; i++) {
        if (num % i == 0) {
            sum += i;
            [arr addObject:[NSString stringWithFormat:@"%ld", i]];
        }
    }
    NSLog(@"%@", arr);
    NSLog(@"약수의 합 : %ld", sum);
    
    return sum;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSLog(@"%ld",[[textField text] integerValue]);
    if ([[textField text] integerValue] != 0) {
        [self.lb setText:[NSString stringWithFormat:@"약수의 합 : %ld", [self factorsSumWithNum:[[textField text] integerValue]]]];
        [self.lb setTextColor:[UIColor blackColor]];
        [textField setText:@""];
    } else {
        [self.lb setText:@"error : 0 이상의 정수를 입력해주세요."];
        [self.lb setTextColor:[UIColor redColor]];
        [textField setText:@""];
    }
    
    return YES;
}


@end
