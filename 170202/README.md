> ##### 2017.02.02 -  #16 (4주차 3번째 수업)

### 프로젝트명
- StarQuiz  (연습문제)
- Day16 (UI View)

### 주제  
- iOS구조 파악
- UI Base Guide 학습

# 내용  
### 연습문제(StarQuiz)  
- 개수와 모드에 맞춰 별찍기

  ```objc    
  //  1 -> ***     2 -> *   
  //       **           **  
  //       *            ***  
     
  //  3 ->   *     4 ->  *  
  //        **          * *  
  //       ***         * * *  
       
  + (void)starStar:(NSUInteger)starNum mode:(NSUInteger)modeNum {
      NSLog(@"starNum: %lu, mode: %lu", starNum, modeNum);
  
      NSString *starStr = [[NSString alloc] init];
      
      for (NSUInteger i = 0 ; i < starNum ; i++) {
          
          switch (modeNum) {
              case 1:
                  for (NSUInteger j = 0 ; j < starNum - i ; j++) {
                      starStr = [starStr stringByAppendingFormat:@"*"];
                  }
                  
                  for (NSUInteger j = 0 ; j < i ; j++) {
                      starStr = [starStr stringByAppendingFormat:@" "];
                  }
                  
                  break;
                  
              case 2:
                  for (NSUInteger j = 0 ; j <= i ; j++) {
                      starStr = [starStr stringByAppendingFormat:@"*"];
                  }
                  
                  break;
                  
              case 3:
                  for (NSUInteger j = 0 ; j < starNum - i -1 ; j++) {
                      starStr = [starStr stringByAppendingFormat:@" "];
                  }
                  
                  for (NSUInteger j = 0 ; j <= i ; j++) {
                      starStr = [starStr stringByAppendingFormat:@"*"];
                  }
                  
                  break;
                  
              case 4:
                  for (NSUInteger j = i ; j < starNum - 1 ; j++) {
                      starStr = [starStr stringByAppendingFormat:@" "];
                  }
                  
                  for (NSUInteger j = starNum - i ; j <= starNum ; j++) {
                      starStr = [starStr stringByAppendingFormat:@"*"];
                      starStr = [starStr stringByAppendingFormat:@" "];
                  }
                  
                  break;
          }
          
          NSLog(@"%@", starStr);  // Log찍고
          starStr = @"";          // 값 초기화
      }
  }
        
  ```  






### iOS 구조  
> [[Apple Documentation] - The App Life Cycle](https://developer.apple.com/library/prerelease/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/TheAppLifeCycle/TheAppLifeCycle.html#//apple_ref/doc/uid/TP40007072-CH2-SW1)  

- The Structure of an App - MVC
- Step of After Launch
- 화면 구조
- View가 그려지는 과정
- 사용자 Event 처리

  
### UI Base Guide
- Resolutions  

   > 디자이너랑 커뮤니케이션 할 때는 픽셀로, 개발할 때는 전부 포인트로  
   > 보통 Point가 Pixel의 (가로세로 각각) 2배, 3배 
   
   - Pixel : 실제 이미지 사이즈
   - Point : 화면에 표시되는 이미지 사이즈


- 기존 앱 UI 분석
    - [Path](https://path.com/) 타임라인   
    
      <a data-flickr-embed="true"  href="https://www.flickr.com/photos/145858067@N03/32522237642/in/dateposted-public/" title="UI 분석 - path"><img src="https://c1.staticflickr.com/1/276/32522237642_42f2d97e4f_b.jpg" width="717" height="1024" alt="UI 분석 - path"></a>  
	  
