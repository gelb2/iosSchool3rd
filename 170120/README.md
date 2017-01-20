> #####2017.01.20 -  #10 (2주차 5번째 수업)

###프로젝트명
- Day4  
- Test

###주제  
- 객체를 생성하면서 필요한 일을 동시에 처리합니다. (초기화 매소드)  
- 클래스와 객체에 대해 다시 한 번 돌아봅니다.  
- 지금까지 배운걸 테스트 해봅니다.

#내용  
###초기화 매소드  
- init 메소드 (자동완성으로 구현됨)  
- init을 Override해서 Custom한 초기화 메소드를 만들 수 있다.  
- initWith... 이렇게 쓰는게 관례  
	> 인스턴스 초기화할 때, name 프로퍼티를 함께 초기화 하고 싶을 때의 예  
   - 헤더 선언부  
     ```
     (instancetype)initWithName:(NSString *)str;
     ```  
     
   - 소스 구현부  
      
       > 추측하건대 NSObject의 init을 호출하는 것일 듯  
       
      ```
      - (instancetype)initWithName:(NSString *)str {
      		self = [super init];
      		self.name = str;
      }
      ```  