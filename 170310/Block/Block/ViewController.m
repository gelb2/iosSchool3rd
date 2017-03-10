//
//  ViewController.m
//  Block
//
//  Created by Jeheon Choi on 2017. 3. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "CustomUIView.h"

@interface ViewController ()

@property __block NSInteger cnt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    double (^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue) {
        return firstValue * secondValue;
    };
    
    double result = multiplyTwoValues(2,4);
    NSLog(@"The result is %f", result);
    
    [self testMethod];
    
    
    /////////////
    
    
    self.cnt = 0;
    
    CustomUIView *view = [[CustomUIView alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width-100, 100) WithBlock:^NSString *{
            self.cnt++;
            NSLog(@"%ld번 버튼 눌림", self.cnt);
            
        return [NSString stringWithFormat:@"눌린 횟수 : %ld", self.cnt];
    }];
    
    [self.view addSubview:view];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Block Capture Value
- (void)testMethod {
    NSInteger anInteger = 42;
    
    void (^testBlock)(void) = ^{
        NSLog(@"Integer is: %ld", anInteger);       // 이 상황을 캡쳐함
    };
    
    anInteger = 84;
    
    testBlock();        // Integer is: 42
}


@end
