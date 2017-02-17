//
//  ViewController.m
//  MorningAlgorithm170216
//
//  Created by Jeheon Choi on 2017. 2. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UITextField *tf;
@property UILabel *lb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];
    
    [self algorithmWithNum:3 cntNum:0];
    [self algorithmWithNum:3 cntNum:0];
    [self algorithmWithNum:3 cntNum:0];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 50)];
    [self.tf setBorderStyle:UITextBorderStyleRoundedRect];
    [self.tf setPlaceholder:@"정수를 입력하세요."];
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(50, 170, self.view.frame.size.width-100, 50)];
    [self.lb setText:@"결과  :"];
    [self.view addSubview:self.lb];
    
}

// 초기 매서드 호출시 cnt = 0으로 넣어야 함
- (NSInteger)algorithmWithNum:(NSInteger)num cntNum:(NSInteger)cnt {

    num = num%2 ? num*3+1 : num/2;
    cnt++;
    
    NSLog(@"num : %ld  cnt : %ld", num, cnt);
    
    return num==1 ? (cnt>500 ? -1 : cnt) : [self algorithmWithNum:num cntNum:cnt];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.lb setText:[NSString stringWithFormat:@"결과 : %ld", [self algorithmWithNum:[textField.text integerValue] cntNum:0]]];
    [textField setText:@""];
    
    return YES;
}

@end
