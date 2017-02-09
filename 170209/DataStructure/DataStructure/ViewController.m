//
//  ViewController.m
//  DataStructure
//
//  Created by Jeheon Choi on 2017. 2. 9..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

#define textHeight 30.0


@interface ViewController ()
<UITextFieldDelegate>

@property NSArray *list;
@property NSDictionary *dic;


@property NSArray *arr;

@property NSMutableArray *mutableArr;
@property UILabel *lb;
@property UITextField *tf;
@property UIButton *btn;

@property NSInteger cnt;

- (NSMutableArray *)adjustTextLabelWithLineNum:(NSUInteger)lineNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //for-in with NSArray
    self.list = [[NSArray alloc] initWithObjects:@"1",@"1", @"3", @"3", @"6", @"7", @"8", nil];
    NSArray *list1 = @[@"1", @"2", @"3", @"4", @"5"];      // literal
    
    for (NSString *num in self.list)
    {
        NSLog(@"%@",num);
    }
    
    //for-in with NSDictionary
    self.dic = [[NSDictionary alloc] initWithObjects:@[@"choi1",@"choi2"] forKeys:@[@"key1",@"key2"]];
    NSDictionary *dic1 = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};      // literal
    
    for (NSString *k in self.dic)
    {
        NSLog(@"%@",k);                         // for-in문을 Dictionary로 돌리면 Key값이 나온다.
        NSLog(@"%@",[self.dic objectForKey:k]);     // value값 이렇게 얻음
    }
    
    //문제1
    self.arr = @[@"4", @"5", @"1", @"2", @"3", @"2", @"3", @"1"];
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];

    //중복 삭제
    for (NSString *i in self.arr)
    {
        if (![tempArr containsObject:i]) {
            [tempArr addObject:i];
            NSLog(@"%@", i);
            
        }
    }
    //정렬
    self.arr = [tempArr sortedArrayUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSLog(@"%@",self.arr);
    
    
    //문제2
    self.cnt = 0;
    self.mutableArr = [[NSMutableArray alloc] init];
    
    //UILabel
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, textHeight*2)];
    [self.lb setText:@"시작해봐\n지금바로!"];
    [self adjustTextLabelWithLineNum:2];    // default line = 2
    [self.lb setTextAlignment:NSTextAlignmentCenter];
    [self.lb setFont:[UIFont boldSystemFontOfSize:textHeight]];
//    [self.lb setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.lb];
    
    //UITextField
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -125, 75, 250, 50)];
    [self.tf setBackgroundColor:[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1]];
    [self.tf setBorderStyle:UITextBorderStyleNone];
    [self.tf setPlaceholder:@"Input"];
    [self.tf setTextAlignment:NSTextAlignmentCenter];
    [self.tf.layer setCornerRadius:5.0];
    [self.view addSubview:self.tf];
    self.tf.delegate = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)adjustTextLabelWithLineNum:(NSUInteger)lineNum
{
    [self.lb setNumberOfLines:lineNum];
    [self.lb setFrame:CGRectMake(0, self.view.center.y-lineNum*textHeight, self.view.frame.size.width, lineNum*textHeight*2)];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"몇개니? %ld",[self.mutableArr count]);
    if(self.cnt == 0) {
        [self.lb setText:[self.tf text]];
    } else {
        [self.lb setText:[NSString stringWithFormat:@"%@\n%@",[self.lb text],[self.tf text]]];
    }
    [self.tf setText:nil];
    self.cnt++;
    NSLog(@"몇개니? %ld",self.cnt);
    [self adjustTextLabelWithLineNum:self.cnt];

    return YES;
}



@end
