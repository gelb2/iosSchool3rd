####2017.02.23 - #29 (7주차 3번째 수업)

#### 오늘은 AT Copy App(170219)에 적용하며 스터디 함

## Singleton
- 싱글톤 이란? 어플리케이션 전 영역에 걸쳐 하나느이 클래스에 **단 하나**의 인스턴스만(객체) 생성하는 것을 싱글톤 패턴이라고 한다.

  - Singleton.h  
  
      ```objc  
      @interface Singleton : NSObject

      + (instancetype)sharedInstance;

      @end

      ```  
  - Singleton.m
    
      ```objc

      @implementation Singleton

      + (instancetype)sharedInstance {
    
            static Singleton *singleton = nil;
    
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                singleton = [[self alloc] init];
            });
    
            return singleton;
      }

      @end

      ```


## NSUserDefault  
> NSUserDefaults에는 날라가도 상관없는 설정값이라던지 없으면 다시 받아올 수 있는 값이라던지 그런 값들을 넣으면 된다고.. (항상 값이 잘 보존되어있다고 보장할 수 없음..)
- 사용자의 정보를 저장하는 **싱글톤 객체**
- 간단한 사용자 정보를 저장/불러오기가 가능하게 만든 객체이다.
- 내부적으로 plist데이터에 저장되어 보안이 강하지 않다.  
- 주요 항목  

 ```objc
 //싱글톤 객체
 + (NSUserDefault *)standardUserDefaults;
 
 //데이터 불러오기
 - (nullable id)objectForKey:(NSString *)defaultName;

 //데이터 저장하기
 - (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

 //데이터 지우기
 - (void)removeObjectForKey:(NSString *)defaultName; 
 ```
