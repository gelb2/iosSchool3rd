//
//  SelectionSort.m
//  Sort
//
//  Created by Jeheon Choi on 2017. 2. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

+ (NSMutableArray *)selectionSortWithArr:(NSMutableArray *)arr
{
    NSUInteger i, j, minIndex, cnt=0;
    
    for (i=0 ; i < arr.count-1 ; i++) {
        minIndex = i;
        for (j=minIndex+1 ; j < arr.count ; j++) {
            if (arr[j] <= arr[minIndex]) {
                minIndex = j;
            }
            cnt++;
        }
        [arr exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
    NSLog(@"selectionSortWithArr -> %@\ncnt = %ld",arr,cnt);
    
    return arr;
}

@end
