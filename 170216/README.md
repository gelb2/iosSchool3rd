#### 2017.02.16 - #25 (6주차 3번째 수업)

## 알고리즘 문제
#### Q.  
콜라즈 추측  
1. 짝수면 2로 나눔  
2. 홀수면 3을 곱하고 1을 더함  
3. 1, 2의 과정을 최종결과가 1이 될 때까지 반복  
4. 1이 될 때까지 총 진행 횟수를 '출력'  

※ 총 횟수가 500이 넘으면 -1을 출력  
ex) 3을 입력 : 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1  
    => 7 출력
    
cf) 500이 넘는 수 : 704623

#### A.  
```objc  
// 초기 매서드 호출시 cnt = 0으로 넣어야 함
- (NSInteger)algorithmWithNum:(NSInteger)num cntNum:(NSInteger)cnt {

    num = num%2 ? num*3+1 : num/2;
    cnt++;
    
    return num==1 ? (cnt>500 ? -1 : cnt) : [self algorithmWithNum:num cntNum:cnt];
}
```  

## UITableView
수업따라 조금씩 조금씩 추가해가며, 테이블뷰 계속 만들어봄 (4개)  

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/145858067@N03/32902900826/in/dateposted-public/" title="TableView"><img src="https://c1.staticflickr.com/1/371/32902900826_01241bbec4_z.jpg" width="360" height="640" alt="TableView"></a>
