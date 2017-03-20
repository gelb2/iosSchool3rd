#### 2017.03.20 - #42 (11주차 1번째 수업)

## Category  
- 서브클래스 없이 기본 클래스에 메소드를 추가 하는 방법  
- 일반적으론 cocoa Framework에 정의된 클래스에 메소드를 추가
- 추가된 메서드는 서브클래스에 의해 상속되며, 원래 클래스의 메소드와 구분되진 않는다.
- 메소드 추가는 가능하나, 프로퍼티를 추가할 수는 없다.
- 클래스의 메소드가 많을 경우, 각 메소드의 성질에 따라 분류하기위해 구현 파일내에서 카테고리로 나눠서 사용한다.
- 기본 클래스에서 추가 메소드나, 분류된 메소드를 추가 파일을 생성하여 사용한다.


### Category 선언  
```objc  
#import "SystemClass.h"

@interface SystemClass (CategoryName)
// 메소드 선언
@end
```  

### Category 명명규칙  
- Base File Name + Category Name
- ex) "UIView + MyCategory.h"
      "NSString + DataFormatter.h"

### Category 구현  
```objc  
#import "SystemClass + CategoryName.h"

@implementation SystemClass (CategoryName)
// 메소드 정의
@end
```  

### Class Extensions  
- 익명 카테고리로 불린다.
- @interface 부분을 나누어 사용할 수 있다. (@ implementation는 분리할 수 없다.)  
- 클래스의 private Property를 만들때 사용한다. (캡슐화)
- 구현 파일내에서 구현해야 한다.

### Extensions 사용  
```objc  
@interface Person()

@property ...
@property ...

@end

@implementation Person

- (void)someMethod:(id)parameter
 {
 }

@end
```  


## UIAnimation  
- 특정 시간 동안 View의 속성값을 변화시키는 작업
  예) move, fade, Size Change, repeat 등
  - UIView Animation
  - UIImageView Animation
  - UIViewController Animation

### Animatable UIView properties
- frame
- bounds
- center
- transform : Modify this property to scale, rotate, or translate the view relative to its center point.
- alpha
- backgroundColor
- contentStretch


### Animation 속성
- Duration : Animation 진행 시간
- Delay : 대기 시간
- Options : Animation 옵션
- Animations : 애니메이션 동작 Block 함수
- Completions : 애니메이션 완료 후 동작 Block 함수

