#### 2017.03.13 - #38 (10주차 1번째 수업)

## Thread
- 스레드(thread)는 어떠한 프로그램 내에서, 특히 **프로세스 내에서 실행되는 흐름의 단위를 말한다.** 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 멀티스레드(multithread)라고 한다.   

  > 프로세스 : 프로그램이 메모리에 올려져 실행되는 것

- 모든 app은 기본적으로 **main thread**를 가지고 있다.
- use UIKit classes only from your app's main thread.  
- 기본적인 UI 및 모든 행동은 main thread에서 실행된다.


## Multi Thread?
- When is use
  - 동시에 작업이 필요한 경우
  - Multi core process를 사용하기 위해
  - 중요한 작업에 방해를 받지 않기 위해
  - 상태를 계속 감시 해야 할 경우가 필요할때
- Multi thread 사용 예
  - Network request / response
  - time control
  - image download / upload
  - long time actions

	  
- 동기 방식 / 비동기 방식
  - 비동기 (Asynchronous: 동시에 일어나지 않는, 같은 시기가 아닌) 
  - 동기 (Synchronous: 동시에 일어나는, 같은 시기)
  
  - 디자인패턴에 의한 비동기처리는 다음과 같은 것들이 있다.
     - 델리게이트(delegate), 셀렉터(@selector), 블록(block), 노티피케이션(Notification)  
     - 큐를 이용한 비동기처리 방법은 GCD로 가능하다.  
         - dispatch_sync(...), dispatch_async(...)

- 교착상태(deadlock)
  - 교착상태란 두 개 이상의 작업이 서로 상대방의 작업이 끝나기 만을 기다리고 있기 때문에 결과적으로 아무것도 완료되지 못하는 상태를 가리킨다.
  - [[블로그] - 데드락, 교착상태 해결 (Dead lock)](http://includestdio.tistory.com/12)

  
  
### iOS MultiThread방법  
- NSThread : 직접 thread를 만들어서 제어 하는 방식
- GCD : Block기반의 기법으로 코드 가독성이 좋고 간편하다.
- NSOperation : GCD기반의 rapper Class. 간단하게 사용가능하고 고수준의 API를 제공한다. 성능이 느린편
- performSelector : Slector를 이용한 방식, ARC이전에 주로 사용한 방식이었으나 GCD이후엔 많이 사용되진 않는다.
- NSTimer : 간단한 interval Notification를 제공해 주는 Class. 특이하게도 NSTimer는 mainLoop에서 실행된다.


## NSThread
- main thread 외 다른 스레드를 만드는 클래스
- UI는 절대 추가 Thread에서 실행시키면 안된다.
- Selector로 실행된 Method가 종료후 자연스럽게 Thread도 종료 된다.
- cancel 명령으로 강제 종료가 되지는 않는다.


```objc
- (IBAction)timerBtn:(id)sender {
    
    [self.timerBtn setSelected:!self.timerBtn.selected];
    NSLog(@"%d", self.timerBtn.selected);
    
    if (self.timerBtn.selected) {
        self.timerThread = [[NSThread alloc] initWithTarget:self selector:@selector(timerThreadStart:) object:nil];
        [self.timerThread start];

        [sender setTitle:@"Cancel" forState:UIControlStateSelected];
    } else {
        [self.timerThread cancel];
//        self.timerThread =nil;      // alloc init을 하든, nil을 하든 다시 스레드 돌리려면 처리해야함
        
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)timerThreadStart:(NSThread *)thread {

    NSLog(@"timerThreadStart");
    
    NSInteger secTime = 0;
    
    while (!self.timerThread.cancelled) {
        [self performSelectorOnMainThread:@selector(changeText:) withObject:[NSString stringWithFormat:@"%ld",secTime] waitUntilDone:NO];
//        [self.numberLabel setText:[NSString stringWithFormat:@"%ld",secTime]];        // UI는 main thread에서
        NSLog(@"time : %ld", secTime);
        
        sleep(1);
        secTime++;
    }
}

- (void)changeText:(NSString *)str {
    [self.numberLabel setText:str];
}
```



## GCD(Grand Central Dispatch)
- 비동기로 작업을 수행시키는 강력하고 쉬운 방법이다.
- 멀티코어 프로세서에서 최적화 되어 작동 된다.
- dispatch queue를 이용해 작업들을 컨트롤 한다.
- Block으로 구현된다.


- dispatch queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
- 모든 dispathc queue는 first-in, first-out 데이터 구조이다.
- dispatch queue는 크게 Serial dispatch queue와 Concurrent dispatch queue 2종류로 나눌 수 있다.


```objc
- (IBAction)btnAction:(id)sender {
    
    [self.timerBtn setSelected:!self.timerBtn.selected];
    
    if (self.timerBtn.selected) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSInteger i = 0;
            while (self.timerBtn.selected) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.numberLabel setText:[NSString stringWithFormat:@"%ld", i]];
                });
                sleep(1);
                i++;
            }
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.numberLabel setText:@"0"];
        });
    }
}

```
