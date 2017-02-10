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

@property UITextField *tf;
@property UILabel *lb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *list1 = [[NSMutableArray alloc] initWithArray:@[@"K",@"O",@"R",@"E",@"A"]];
    NSMutableArray *list2 = [[NSMutableArray alloc] initWithArray:@[@"E",@"R",@"A",@"S",@"E",@"R"]];
    
    [self algorithmWithArray:list1];
    [self algorithmWithArray:list2];
    
    [self algorithmWithUI];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)algorithmWithArray:(NSArray *)arr
{
    NSMutableArray *resultArr = [[NSMutableArray alloc] init];
    if (arr.count %2) {
    // odd case
        [resultArr addObject:arr[(NSUInteger)arr.count/2]];
        NSLog(@"%@",resultArr[0]);
    } else {
    // even case
        [resultArr addObject:arr[arr.count/2 - 1]];
        [resultArr addObject:arr[(NSUInteger)arr.count/2]];
        NSLog(@"%@, %@",resultArr[0], resultArr[1]);
    }
    
    return resultArr;
}

- (void)algorithmWithUI
{
    //TextField
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x-100, 100, 200, 35)];
    [self.tf setBorderStyle:UITextBorderStyleRoundedRect];
    [self.tf setPlaceholder:@"여기에 입력해주세요."];
    self.tf.delegate = self;
    [self.view addSubview:self.tf];

    //Label
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-100, self.tf.frame.size.height+150, 200, 35)];
    [self.lb setText:@"결과: "];
    [self.view addSubview:self.lb];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [self.tf.text enumerateSubstringsInRange:NSMakeRange(0, [self.tf.text length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [arr addObject:substring];
    }];

    NSMutableArray *arr2 = [[NSMutableArray alloc] initWithArray:[self algorithmWithArray:arr]];
    
    if(arr2.count == 2) {
        [self.lb setText:[NSString stringWithFormat:@"결과: %@%@",arr2[0], arr2[1]]];
    } else {
        [self.lb setText:[NSString stringWithFormat:@"결과: %@",arr2[0]]];
    }
    
    [self.tf setText:@""];

    return YES;
}


@end
