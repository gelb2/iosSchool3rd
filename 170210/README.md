#### 2017.02.10 - #22 (5주차 5번째 수업)

## Property

## ARC (Automatic Reference Counting)


- 예외상황 : NSString weak 프로퍼티에 리터럴로 값을 넣으면 null이 아니다. -> String Literal은 Data 영역에 생성된다.  

  > [블로그 - "C/C++ - String Literal의 특징"](http://sweeper.egloos.com/133866)

  - Class.h
  
     ```objc
     @property (weak) NSString *weakStr1;
     @property (weak) NSString *weakStr2;
     ```

  - Class.m  

     ```objc
     self.weakStr1 = [[NSString alloc] initWithString:[NSString stringWithFormat:@"12345"]];  
     NSLog(@"%@",self.weakStr1);   // 출력 -> (null)
   
     self.weakStr2 = @"6789";
     NSLog(@"%@",self.weakStr2);   // 출력 -> 6789
     ```  

