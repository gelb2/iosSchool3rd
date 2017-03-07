####2017.03.06 - #35 (9주차 1번째 수업)

## 타입 별칭 typedef  

## 상수 constant  
- 변하지 않는 값을 생성하고자 할 때 사용
- const 키워드 사용

```objc
NSInteger const age = 26;
NSString * const name = @"choi";
const NSString *name2 = @"joo";	// 이렇게 하면 값 고정이 아닌, 주소값이 고정됨.  

//age = 30;	// 에러
//name = @"choijeheon";	// 에러

name2 = @"joojoo";	// 정상 작동 됨

```

## 열거형 enumeration  
- 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의
- 예) 요일, 상태값, 월(Month) 등  

```objc
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
};
```

## 옵션 option  
- 열거형과 유사한 모습으로 옵션값을 정의  
- 주로 비트플래그를 사용하여 정의  

```objc
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};
```


## 매크로 macro  
- 전처리자(Preprocessor)의 일종인 #define을 사용하여 정의  
- 단순한 수식 또는 변치않을 값을 정의하는데 주로 사용  

```objc
#define PI 3.141592
NSLog(@"%f", PI);

#define add(A, B) A+B
add(3,5)	// 3+5 -> 8
```

## const VS define  
- 애플에서는 define 쓰지 말라 권고함
- [[StackOverFlow] What is the best way to create constants in Objective-C](http://stackoverflow.com/questions/17228334/what-is-the-best-way-to-create-constants-in-objective-c)

