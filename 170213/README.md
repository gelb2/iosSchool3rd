####2017.02.13 - #23 (6주차 1번째 수업)

## 알고리즘 문제
####Q.  
TextField로 입력받은 숫자가 Harshad Number인지 아닌지 알아내기 (Harshad Number : 숫자 / 각자릿수 합 = 정수)

####A.  
```objc
// Integer Version
- (BOOL)algorithmWithNum:(NSInteger)num
{
    NSString *str = [NSString stringWithFormat:@"%ld", num];
    NSUInteger sum = 0;
    
    for (NSInteger i = 0; i < [str length]; i++) {
        NSInteger p = self.num % (NSInteger)pow(10, i+1);
        NSInteger q = ((NSInteger)pow(10, i) != 0) ? (NSInteger)pow(10, i) : 1;

        sum += p/q;
    }
    
    if((float)num/sum - num/sum == 0) {     // num % sum == 0 이 더 간결한듯
        return TRUE;
    }
    return FALSE;
}

// String Version
- (BOOL)algorithmWithNumStrVer:(NSInteger)num
{
    NSString *strNum = [NSString stringWithFormat:@"%ld", num];
    NSUInteger sum = 0;

    for (NSInteger i = 0 ; i < [strNum length] ; i++ ) {
        sum += [[strNum substringWithRange:NSMakeRange(i, 1)] integerValue];
    }
    if((float)num/sum - num/sum == 0) {
        return TRUE;
    }
    return FALSE;
}

```

## Application Life Cycle

