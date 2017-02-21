//
//  ViewController.m
//  MorningAlgorithm170221
//
//  Created by Jeheon Choi on 2017. 2. 21..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property (weak) UILabel *lb1;
@property (weak) UILabel *lb2;
@property (weak) UITextField *tf1;
@property (weak) UITextField *tf2;

@property (weak) UILabel *resultLb;
@property UITextField *respondingTf;

@property NSInteger num1;
@property NSInteger num2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createSubviews];
    
//    [self findGcdAndLcmWithNum1:1 withNum2:2];
//    [self findGcdAndLcmWithNum1:3 withNum2:6];
//    [self findGcdAndLcmWithNum1:12 withNum2:8];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




///// SubViews 생성 및 배치 ///////

- (void)createSubviews {
    
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 60, 40)];
    [lb1 setText:@"Num1 : "];
    [self.view addSubview:lb1];
    self.lb1 = lb1;
    
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 170, 60, 40)];
    [lb2 setText:@"Num2 : "];
    [self.view addSubview:lb2];
    self.lb2 = lb2;
    
    
    UITextField *tf1 = [[UITextField alloc] initWithFrame:CGRectMake(120, 100, self.view.frame.size.width-170, 40)];
    [tf1 setBorderStyle:UITextBorderStyleRoundedRect];
    tf1.delegate = self;
    tf1.tag = 100;
    [tf1 setKeyboardType:UIKeyboardTypeNumberPad];
    [tf1 addTarget:self action:@selector(editingTextField:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:tf1];
    self.tf1 = tf1;
    
    
    UITextField *tf2 = [[UITextField alloc] initWithFrame:CGRectMake(120, 170, self.view.frame.size.width-170, 40)];
    [tf2 setBorderStyle:UITextBorderStyleRoundedRect];
    tf2.delegate = self;
    tf2.tag = 200;
    [tf2 setKeyboardType:UIKeyboardTypeNumberPad];
    [tf2 addTarget:self action:@selector(editingTextField:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:tf2];
    self.tf2 = tf2;
    
    // 텍스트 필드 밖을 눌렀을 때, 키보드가 사라질 수 있게 하기 위한 이벤트
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *resultText = [[UILabel alloc] initWithFrame:CGRectMake(50, 240, 60, 40)];
    [resultText setText:@"Result : "];
    [self.view addSubview:resultText];
    
    UILabel *resultLb = [[UILabel alloc] initWithFrame:CGRectMake(120, 240, self.view.frame.size.width-170, 60)];
    [resultLb setNumberOfLines:2];
    [resultLb setText:@"최대공약수는 0\n최소공배수는 0 입니다."];
    [self.view addSubview:resultLb];
    self.resultLb = resultLb;
    
}


///// 알고리즘 처리 //////


- (NSArray *)findGcdAndLcmWithNum1:(NSInteger)num1 withNum2:(NSInteger)num2 {
    
    NSInteger GCD = 0;  // the greatest common denominator : 최대공약수
    NSInteger LCM = 0;  // the least common multiple       : 최소공배수
    
    // 최대공약수 찾기
    for (NSInteger i = (num1<num2 ? num1 : num2) ; i>0 ; i--) {
        if (!(num1%i) && !(num2%i)) {
            GCD = i;
            break;
        }
    }
    
    // 최소공배수 찾기
    for (NSInteger i = (num1<num2 ? num2 : num1) ; i>0 ; i++) {
        if (!(i%num1) && !(i%num2)) {
            LCM = i;
            break;
        }
    }
    
    NSLog(@"GCD : %ld, LCM : %ld ", GCD, LCM);
    [self.resultLb setText:[NSString stringWithFormat:@"최대공약수는 %ld\n최소공배수는 %ld 입니다.", GCD, LCM]];
    
    return @[[NSString stringWithFormat:@"%ld", GCD], [NSString stringWithFormat:@"%ld", LCM]];
}

- (void)editingTextField:(UITextField *)sender {
    if (sender.tag == 100){
        self.num1 = [sender.text integerValue];
    } else {
        self.num2 = [sender.text integerValue];
    }
    
    if (self.num1 && self.num2) {
        [self findGcdAndLcmWithNum1:self.num1 withNum2:self.num2];
    }
}



////// 키보드 처리 //////

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    if (textField.tag == 100) {
//        [self.tf2 becomeFirstResponder];
//    } else {
//        [self.tf2 resignFirstResponder];
//    }
//    return YES;
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.respondingTf = textField;
}

-(void)dismissKeyboard {
    [self.respondingTf resignFirstResponder];
    self.respondingTf = nil;
    
}




@end
