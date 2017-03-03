//
//  ViewController.m
//  DataTest
//
//  Created by Jeheon Choi on 2017. 3. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];     // 싱글톤 객체
    
    NSArray *list = [NSArray arrayWithContentsOfFile:filePath];
    
    NSLog(@"list %@", list);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
