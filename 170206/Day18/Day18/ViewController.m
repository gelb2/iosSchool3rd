//
//  ViewController.m
//  Day18
//
//  Created by Jeheon Choi on 2017. 2. 6..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"


int num = 1;

@interface ViewController ()

//2
<UITextFieldDelegate>
@property UITextField *tf;
@property UILabel *lb;


//1
@property UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (num == 1) {
        // 문제 1

        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        view1.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        view1.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view1];

        
        NSMutableArray *btnArr = [NSMutableArray array];
        
        for (int i = 0 ; i<4 ; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnArr addObject:btn];
            
            switch (i) {
                case 0:
                    [btn setFrame:CGRectMake(10, 10, 85, 85)];
                    btn.backgroundColor = [UIColor orangeColor];
                    [btn setTitle:@"1high" forState:UIControlStateHighlighted];
                    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
                    btn.tag = 1;
                    break;
                case 1:
                    [btn setFrame:CGRectMake(20 + 85, 10, 85, 85)];
                    btn.backgroundColor = [UIColor greenColor];
                    btn.tag = 2;
                    break;
                case 2:
                    [btn setFrame:CGRectMake(10, 20 + 85, 85, 85)];
                    btn.backgroundColor = [UIColor blueColor];
                    btn.tag = 3;
                    break;
                case 3:
                    [btn setFrame:CGRectMake(20 + 85, 20 + 85, 85, 85)];
                    btn.backgroundColor = [UIColor yellowColor];
                    btn.tag = 4;
                    break;
                default:
                    NSLog(@"여기 들어올리가 없는데?");
                    break;
            }
            [btn setTitle:[NSString stringWithFormat:@"%ldbtn", [btnArr indexOfObject:btn] + 1] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"%ldbtn", [btnArr indexOfObject:btn] + 1] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [btn.layer setCornerRadius:10];
            [btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [view1 addSubview:btn];
            
            
//            self.btn = btnArr[0];

        }
    } else if (num == 2) {
        // 문제 2
        
        self.tf = [[UITextField alloc] initWithFrame:CGRectMake(40, 40, 180, 35)];
        self.tf.borderStyle = UITextBorderStyleRoundedRect;
        self.tf.placeholder = @"텍스트 입력";
        self.tf.delegate = self;
        self.tf.tag = 1000;
        self.tf.textColor = [UIColor purpleColor];
        [self.tf setClearButtonMode:UITextFieldViewModeAlways];
        [self.tf setLeftViewMode:UITextFieldViewModeWhileEditing];
        self.tf.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.tf.leftView.backgroundColor = [UIColor blueColor];
        [self.tf setRightViewMode:UITextFieldViewModeWhileEditing];
        self.tf.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.tf.rightView.backgroundColor = [UIColor blackColor];
        [self.tf addTarget:self action:@selector(didEdittedTF:) forControlEvents:UIControlEventEditingChanged];
        [self.view addSubview:self.tf];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(240, 40, 35, 35)];
        [btn setTitle:@"확인" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        self.lb = [[UILabel alloc] initWithFrame:CGRectMake(45, 80, 180, 35)];
        [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.placeholder]];
        [self.lb setTextColor:[UIColor blackColor]];
        [self.view addSubview:self.lb];
        
        
        UITextField *tf2 = [[UITextField alloc] initWithFrame:CGRectMake(40, 150, 180, 35)];
        tf2.borderStyle = UITextBorderStyleNone;
        [tf2 setClearButtonMode:UITextFieldViewModeNever];
        tf2.placeholder = @"텍스트 입력";
        tf2.delegate = self;
        tf2.tag = 2000;
        tf2.textColor = [UIColor purpleColor];
        [self.view addSubview:tf2];
        
        UITextField *tf3 = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 180, 35)];
        tf3.borderStyle = UITextBorderStyleLine;
        [tf3 setClearButtonMode:UITextFieldViewModeWhileEditing];
        tf3.placeholder = @"텍스트 입력";
        tf3.delegate = self;
        tf3.tag = 3000;
        tf3.textColor = [UIColor purpleColor];
        [self.view addSubview:tf3];
        
        
        UITextField *tf4 = [[UITextField alloc] initWithFrame:CGRectMake(40, 350, 180, 35)];
        tf4.borderStyle = UITextBorderStyleBezel;
        [tf4 setClearButtonMode:UITextFieldViewModeUnlessEditing];
        tf4.placeholder = @"텍스트 입력";
        tf4.delegate = self;
        tf4.tag = 4000;
        tf4.textColor = [UIColor purpleColor];
        [self.view addSubview:tf4];
        
        
        
    }
//    UITextBorderStyleNone,
//    UITextBorderStyleLine,
//    UITextBorderStyleBezel
//    typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
//        UITextFieldViewModeNever,
//        UITextFieldViewModeWhileEditing,
//        UITextFieldViewModeUnlessEditing,
//        UITextFieldViewModeAlways
//    };
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"리턴키 눌렀다.");
//    if (textField.tag == 1000) {        // 이젠 필요없음
        [self.tf resignFirstResponder];
        [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//    } else {
//        NSLog(@"후후후후");
//    }
    return YES;
}


//- (BOOL)textFieldShouldClear:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldClear"
//    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//    return YES;
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldDidBeginEditing");
//    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldDidEndEditing");
//    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//}
//
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldBeginEditing");
//    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//    return YES;
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldEndEditing");
//    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
//    return YES;
//}

- (void)didEdittedTF:(UITextField *)sender {
    NSLog(@"didEdittedTF");
    [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
}


- (void)didSelectedBtn:(UIButton *)sender {
    if (num == 1) {
        NSLog(@"%ld",[sender.currentTitle integerValue]);

        self.btn.selected = NO;
        self.btn = sender;
        self.btn.selected = YES;
        
    } else if (num == 2) {
        
        if ([self.tf isFirstResponder]) {
//            [self.tf resignFirstResponder];
//            [self.lb setText:[NSString stringWithFormat:@"결과 : %@", self.tf.text]];
            [self textFieldShouldReturn:self.tf];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
