####2017.03.10 - #37 (9주차 3번째 수업)

## Block  
- Block은 Objective-C의 **객체**다.
- **C**, C++, Objective-C에 추가된 확장 문법이다.
- ^ 을 literal 문법으로 첫 시작시 사용한다.
- 외부 값을 **capture**해서 사용한다.
- 다른 프로그램 언어의 closures나 lambdas와 같은 역할을 한다.
- **이름 없는 함수**라 불리기도 한다.  
- 함수를 변수처럼 주고 받을 수 있다.
- **Block 문법**
	- 선언  

	  ```objc
	  void (^simpleBlock)(void);
	  ```
	  
	- Call
	  
	  ```objc
	  simpleBlock = ^{
		  NSLog(@"This is a block");
	  }
	  ```
	  
	- 합치기
	
	  ```objc
	  void (^simpleBlock)(void) = ^{
		  NSLog(@"This is a block");
	  };
	  ```
	  
   - Block 사용  
   
     ```objc
     simpleBlock();
     ```

   - 다중 파라미터, 리턴 타입  
   
     ```objc
     double (^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue) {
        	return firstValue * secondValue;
     };
    
     double result = multiplyTwoValues(2,4);
     NSLog(@"The result is %f", result);
     ```  
     
   - Block Capture Value
  
     ```objc
     - (void)testMethod {
            NSInteger anInteger = 42;
     
            void (^testBlock)(void) = ^{
                NSLog(@"Integer is: %ld", anInteger);       // 이 상황을 캡쳐함
            };
     
	         anInteger = 84;
      
	         testBlock();        // Integer is: 42
     }
     ```  
     
   
     