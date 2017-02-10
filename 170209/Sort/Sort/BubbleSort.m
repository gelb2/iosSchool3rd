//
//  BubbleSort.m
//  Sort
//
//  Created by Jeheon Choi on 2017. 2. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

+ (NSMutableArray *)bubbleSortWithArr:(NSMutableArray *)arr
{
    NSUInteger cnt=0;
    //    NSLog(@"arr[%d] ~ arr[%ld]",0,[arr count]-1);
    //    NSLog(@"%@",arr);
    
    for (NSInteger i=0 ; i < arr.count-1 ; i++) {
        for (NSInteger j=0 ; j < arr.count-1 ; j++) {
            //            NSLog(@"i: arr[%ld] = %@, j : arr[%ld] = %@",j,arr[j],j+1,arr[j+1]);
            if (arr[j] > arr[j+1]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            cnt++;
        }
    }
    NSLog(@"bubbleSortWithArr -> %@\ncnt = %ld",arr,cnt);
    
    return arr;
}

@end
