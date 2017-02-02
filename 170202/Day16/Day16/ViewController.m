//
//  ViewController.m
//  Day16
//
//  Created by Jeheon Choi on 2017. 2. 2..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *myView;       // 프로퍼티로 만들어야 사용 가능

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 300)];
//    myView.backgroundColor = [UIColor blueColor];
//    myView.clipsToBounds = YES;
//    [self.view addSubview:myView];
//    
//    UIView *subView = [[UIView alloc] init];
//    subView.frame = CGRectMake(10, 30, 200, 200);
//    [subView setBackgroundColor:[UIColor redColor]];
//    [myView addSubview:subView];
////    [self.view addSubview:subView];
//
//    
//    [self changeColor];
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 345, 100)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(15, self.view.frame.size.height-115, 345, 100)];   // 이런 방법으로 하면 기기 해상도가 달라져도 대응 가능 (height)
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
}


- (void)changeColor //메소드 생성 및 사용
{
    //myView의 컬러를 변경하는 것
    //위 인터페이스 안에 프로퍼티로 만들어주고 self로 받아야 함
    self.myView.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
