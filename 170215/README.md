####2017.02.15 - #24 (6주차 2번째 수업)

## 알고리즘 문제
####Q.  
약수의 합 출력
ex) 12의 약수 = 1, 2, 3, 4, 6, 12 -> 약수 sum = 28

####A.  
```objc
- (NSInteger)factorsSumWithNum:(NSInteger)num {
    NSInteger sum = 1;  // 1은 모든 수의 약수, 일단 갖고 시작함
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"1", nil];
    
    for (NSInteger i = 2; i <= num; i++) {
        if (num % i == 0) {
            sum += i;
            [arr addObject:[NSString stringWithFormat:@"%ld", i]];
        }
    }
    NSLog(@"%@", arr);
    NSLog(@"약수의 합 : %ld", sum);
    
    return sum;
}

```

## UITableView

