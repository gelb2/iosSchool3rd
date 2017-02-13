//
//  ViewController.m
//  MorningAlgorithm
//
//  Created by Jeheon Choi on 2017. 2. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property NSInteger num;
@property UITextField *tf;
@property UILabel *lb;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    NSLog(@"viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.num = 13;
    
    [self algorithmWithNum:self.num];
    [self algorithmWithNumStrVer:self.num];
    
    [self algorithmWithUI];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)algorithmWithNum:(NSInteger)num
{
    NSString *str = [NSString stringWithFormat:@"%ld", num];
    NSUInteger sum = 0;
    
    for (NSInteger i = 0; i < [str length]; i++) {
        NSInteger p = self.num % (NSInteger)pow(10, i+1);
        NSInteger q = ((NSInteger)pow(10, i) != 0) ? (NSInteger)pow(10, i) : 1;

        sum += p/q;
    }
    
    if((float)num/sum - num/sum == 0) {     // num % sum이 더 간결한듯
        return TRUE;
    }
    return FALSE;
}

- (BOOL)algorithmWithNumStrVer:(NSInteger)num
{
    NSString *strNum = [NSString stringWithFormat:@"%ld", num];
    NSUInteger sum = 0;

    for (NSInteger i = 0 ; i < [strNum length] ; i++ ) {
        sum += [[strNum substringWithRange:NSMakeRange(i, 1)] integerValue];
    }
    if((float)num/sum - num/sum == 0) {
        return TRUE;
    }
    return FALSE;
}

- (void)algorithmWithUI
{
    //TextField
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x-100, 100, 200, 35)];
    [self.tf setBorderStyle:UITextBorderStyleRoundedRect];
    [self.tf setPlaceholder:@"여기에 숫자를 입력해주세요."];
    self.tf.delegate = self;
    [self.view addSubview:self.tf];

    //Label
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-100, self.tf.frame.size.height+150, 200, 35)];
    [self.lb setText:@"결과: "];
    [self.view addSubview:self.lb];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 숫자 외 문자 예외처리 안함
    if ([self algorithmWithNum:[[self.tf text] integerValue]]) {
        [self.lb setText:@"결과: Harshad Number!"];
    } else {
        [self.lb setText:@"결과: No Harshad Number"];
    }
    
    return YES;
}


@end
