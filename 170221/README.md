####2017.02.21 - #28 (7주차 2번째 수업)

## 알고리즘 문제  
####Q. 숫자 두개 입력받아 최대공약수, 최소공배수 출력하기  


####A.  
```objc
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
    
    return @[[NSString stringWithFormat:@"%ld", GCD], [NSString stringWithFormat:@"%ld", LCM]];
}

```


## NavigationBar
- NavigationBar의 Frame 변경이 불가능  
- 높이 64pt로 고정..(상태바 20pt, 네비바 44pt)

### ToolBar
- 뷰컨트롤러의 부가적 기능을 위해 ToolBar를 활용할 수 있다.  
- 기본 옵션은 hidden이다.


## TabBarController  
- 이 역시 Frame 변경 불가..
- 높이 46pt 고정
- item 5개까지 표시 가능 (5개 넘어가면 자동으로 ...More로 표현됨)