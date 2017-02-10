//
//  main.m
//  Sort
//
//  Created by Jeheon Choi on 2017. 2. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectionSort.h"
#import "BubbleSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[@5,@4,@3,@2,@1]];
        
        //선택정렬
        [SelectionSort selectionSortWithArr:arr];
        //버블정렬
        [BubbleSort bubbleSortWithArr:arr];
        
    }
    return 0;
}
