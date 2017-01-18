#####8번째 수업 / #2-3
###실습 프로젝트
1. Day3  
2. War  

###주제  
1. 매개변수를 가지는 메서드
2. 데이터 타입  
3. 다형성

    > **그외 꿀팁**   
    > 
    > 1. 헤더, 소스 왔다갔다  
    >    ``control + command + 위 or 아래``  
    > 2. 영문타자 연습 사이트  
    >   <http://www.keybr.com>

###매개변수를 가지는 메서드  
> 메서드 선언, 호출 방식이 독특한데  
> Obejective-C에서 메서드를 호출할 때를, 메시지라고 부름  
> 편지의 개념...이라 생각해볼 수 있을 듯  
> 
> self : 객체 스스로 자신을 지칭할 때 사용하는 키워드

- 매개변수 1개  
``- (<반환타입>)<메서드 이름:(<타입>)<내부이름>``   
- 매개변수 2개  
      ``- (<반환 타입>)<메서드 이름>:(<타입>)<내부이름> <외부이름>:(<타입>)<내부이름>;``  
- 매개변수 n개  
	  ``- (<반환 타입>)<메서드 이름>:(<타입>)<내부이름> <외부이름>:(<타입>)<내부이름>  ... ;``
	  
	  위 문법을 아래처럼 줄을 나눠보면  
	  왜 이렇게 문법을 만들었는지 조금은 더 직관적으로 이해할 수 있음
	
	    (<반환 타입>)<메서드 이름>:(<타입>)<내부이름>  
	                 <외부이름>:(<타입>)<내부이름>
	                 ... ;
	                 

   
###데이터 타입  
> Value Type을 직접 표현할 때에는 포인터를 사용하지 않는다.  
> Reference Type을 표현할 때에는 포인터를 사용한다.  
> id라는 타입은 **모든 객체 타입**을 의미  

- 불리언 표현 (BOOL)  
  - 값 : YES or NO  
- 숫자 표현  
  - 정수  
     > Objective-C에서는 int를 사용하지 않습니다.  
     
     - 부호가 있는 정수 : NSInteger  
     - 부호가 없는 정수 : NSUInteger  
  - 실수  
    > CGFloat 쓰는걸 추천
  	 - 32bit 실수 표현 : float  
  	 - 64bit 실수 표현 : double  
  	 - Core Graphic용 실수 표현 : **CGFloat**  
  - 객체형  
      > @ 뒤에 숫자를 써주었던 것이 객체로 사용한 것  
      - NSNumber  
      
- 문자 표현     
  - 문자  
     - 단 하나의 문자를 표현 : char [Value Type]  
  - 문자열  
     - 문장 또는 문단을 표현 : **NSString** [Reference Type]   
- 형식지정자 (Format Specifiers)  
   > [Apple - String Format Specifiers](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html)  
  - %@, %%, %d, %ld ...


###다형성(polymorphism)
> 프로그램 언어의 각 요소들(상수, 변수, 식, 오브젝트, 함수, 메서드 등)이  
> 다양한 데이터 타입에 속하는 것이 허가되는 성질

