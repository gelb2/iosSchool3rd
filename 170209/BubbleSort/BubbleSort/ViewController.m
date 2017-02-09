//
//  ViewController.m
//  BubbleSort
//
//  Created by Jeheon Choi on 2017. 2. 9..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//- (NSMutableArray *)bubbleSortWithArr:(NSMutableArray *)arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[@5,@4,@2,@3,@1]];
    arr = [self bubbleSortWithArr:arr];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *)bubbleSortWithArr:(NSMutableArray *)arr
{
    NSLog(@"arr[%d] ~ arr[%ld]",0,[arr count]-1);
    NSLog(@"%@",arr);
    
    for (NSInteger i=0 ; i < arr.count-1 ; i++) {
        for (NSInteger j=0 ; j < arr.count-1 ; j++) {
            NSLog(@"i: arr[%ld] = %@, j : arr[%ld] = %@",j,arr[j],j+1,arr[j+1]);
            if (arr[j] > arr[j+1]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                NSLog(@"%@",arr);
            }
        }
    }
    NSLog(@"최종 : %@",arr);
    
    return arr;
}


@end
