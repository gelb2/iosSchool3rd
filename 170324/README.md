#### 2017.03.24 - #45 (11주차 4번째 수업)
> 마지막 수업  


## Search  
> Apple API Reference  
> - [UISearch​Controller](https://developer.apple.com/reference/uikit/uisearchcontroller)  
> - [UISearchBar](https://developer.apple.com/reference/uikit/uisearchbar)  

### RealmSearch
> [[Realm] iOS 검색 컨트롤러 만들기 (Objective-C)](https://realm.io/kr/news/building-an-ios-search-controller-in-objective-c/)

## Project Setting  

### Precompiled Header  
- 컴파일 전에 자주 사용하는 헤더파일을 미리 컴파일 하여 캐쉬에 저장
- 헤더파일 컴파일 시간을 단축시키기 위해 사용
- 전역적으로 사용하고 싶은 데이터를 헤더 파일선언하고 pch파일에 넣어 전역적으로 사용가능
- Buile Setting -> Apple LLVM 8.0 Language -> Prefix Header에 만든 pch파일 경로 입력


### 버전 가져오기
```objc  
[[UIDevice currentDevice] systemName];     // ex. iOS  
[[UIDevice currentDevice] systemVersion];  // ex. 10.2.1  
```


### Preprocessor Macros - Debug
- Buile Setting -> Apple LLVM 8.0 Preprocessing -> Preprocessor Macros에서 모드 수정

```objc  
#ifdef DEBUG  
    // debug only code  
    NSLog(@"debug mode");  
#else  
    // release only code  
    NSLog(@"release mode");  
#endif  
```  

### Preprocessor Macros - Device  
- TargetConditionals.h에 정의되어있다.  

```objc  
#ifdef TARGET_OS_SIMULATOR  
    // simulator only code  
    NSLog(@"simulator");  
#else  
    // device only code  
    NSLog(@"device");  
#endif  
```  


### 번외
- UIColletionView로 CoverFlow 만들기
