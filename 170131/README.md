> #####2017.01.31 -  #14 (4주차 1번째 수업)

###프로젝트명
- Exam0131 (플젝명은 Exam이나, 사실상 Review임)

###주제  
- 지금까지 배운걸 실습을 통해 복습해봅니다.
- switch문을 학습해봅니다.

#내용  
###switch문 
- 상태값은 **정수형**이여만 한다.  
- 문법도, 기능도 C언어와 같다.
- default를 안써도 된다.  


  ```
    switch (상태값) {
  		case 상태값1:
  			// 해당 상태값일때 실행될 내용
  			break;
		case 상태값2:
			// 해당 상태값일때 실행될 내용
  			break;
		...
		default:
			// 해당되는 상태값이 없일때 실행될 내용
			break;
    }
  ```  