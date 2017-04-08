#### 2017.02.17 - #26 (6주차 4번째 수업)

## 알고리즘 문제
#### Q. 계단 오르기  
모든 경우의 수 구하기  
단, 계단은 한번에 1 or 2칸씩 오를 수 있다.

ex) 4개 계단  
(1, 1, 1, 1)  
(1, 1, 2)  
(1, 2, 1)   
(2, 1, 1)  
(2, 2)  
->  총 5가지  

#### A.  
```objc  
// 이 메서드로 알고리즘 연산 시작
- (NSInteger)stepCaseNumWithSteps:(NSInteger)steps {
    self.count = 0;
    return [self stepCaseAlgorithm:steps];
}

- (NSInteger)stepCaseAlgorithm:(NSInteger)restSteps {
    for (NSInteger i = 1; i <= 2; i++) {
        if (restSteps - i == 0) {
            self.count++;
        } else if (restSteps - i > 0) {
            [self stepCaseAlgorithm:restSteps - i];
        }
    }
    return self.count;
}
```  

## UITableView
- CustomUIView (CustomUITableViewCell 실습)  

  > 디자인 안습...  
 
  <a data-flickr-embed="true"  href="https://www.flickr.com/photos/145858067@N03/32906060616/in/dateposted-public/" title="CustomUITableViewCell"><img src="https://c1.staticflickr.com/1/317/32906060616_11aed80550_z.jpg" width="360" height="640" alt="CustomUITableViewCell"></a>
