//
//  ViewController.m
//  NSThread
//
//  Created by Jeheon Choi on 2017. 3. 13..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic) NSThread *timerThread;
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timerBtn:(id)sender {
    
    [self.timerBtn setSelected:!self.timerBtn.selected];
    NSLog(@"%d", self.timerBtn.selected);
    
    if (self.timerBtn.selected) {
        self.timerThread = [[NSThread alloc] initWithTarget:self selector:@selector(timerThreadStart:) object:nil];
        [self.timerThread start];

        [sender setTitle:@"Cancel" forState:UIControlStateSelected];
    } else {
        [self.timerThread cancel];
//        self.timerThread =nil;      // alloc init을 하든, nil을 하든 다시 스레드 돌리려면 처리해야함
        
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)timerThreadStart:(NSThread *)thread {

    NSLog(@"timerThreadStart");
    
    NSInteger secTime = 0;
    
    while (!self.timerThread.cancelled) {
        [self performSelectorOnMainThread:@selector(changeText:) withObject:[NSString stringWithFormat:@"%ld",secTime] waitUntilDone:NO];
//        [self.numberLabel setText:[NSString stringWithFormat:@"%ld",secTime]];        // UI는 main thread에서
        NSLog(@"time : %ld", secTime);
        
        sleep(1);
        secTime++;
    }
}

- (void)changeText:(NSString *)str {
    [self.numberLabel setText:str];
}

@end
