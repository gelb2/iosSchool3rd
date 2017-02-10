####2017.02.09 - #21 (5주차 4번째 수업)

#자료구조 2

##for-in
```objc
for (<type *object> in <collection>) {
    <statements>
}

//for-in with NSArray

//for-in with NSDictionary
NSDictionary *dic1 = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
for (NSString *k in dic1)
{
    NSLog(@"%@",k);		// for-in문을 Dictionary로 돌리면 Key값이 나온다.
    NSLog(@"%@",[dic1 objectForKey:k]);     // value는 이렇게..
}

```


##처음부터? 마지막부터? (스택 & 큐)  
###스택 (Stack)

###큐 (Queue)  


##정렬 알고리즘  
###1. 단순 비효율 정렬 : O(n^2)  
####selection sort (선택 정렬)    

```objc
- (NSMutableArray *)selectionSortWithArr:(NSMutableArray *)arr
{
    NSUInteger i, j, minIndex;
    
    for (i=0 ; i < arr.count-1 ; i++) {
        minIndex = i;
        for (j=minIndex+1 ; j < arr.count ; j++) {
            if (arr[j] <= arr[minIndex]) {
                minIndex = j;
            }
        }
        [arr exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
    
    return arr;
}
```  

####insertion sort (삽입 정렬)  
####bubble sort (버블 정렬)  
```objc
- (NSMutableArray *)bubbleSortWithArr:(NSMutableArray *)arr
{
    for (NSInteger i=0 ; i < arr.count-1 ; i++) {
        for (NSInteger j=0 ; j < arr.count-1 ; j++) {
            if (arr[j] > arr[j+1]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    
    return arr;
}
```

###2. 복잡 효율 정렬  
####merge sort (합병 정렬)  
####quick sort (퀵 정렬)  
####heap sort (힙 정렬)  
####radix sort (기수 정렬)  

##알고리즘 복잡도
- 가장 최악의 경우 걸리는 시간  
- big O 표기법으로 표시  





