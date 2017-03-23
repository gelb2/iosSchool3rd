#### 2017.03.23 - #44 (11주차 3번째 수업)

## Segue  
> [애플 공식문서 : Using Segues](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html)    

- 앱의 인터페이스 흐름을 정의하는 데 segues를 사용합니다.
- segue는 앱의 스토리 보드 파ㅣㄹ에 두 개의 뷰 컨트롤러 사이의 전환을 정의합니다.
- segue의 시작점은 button, tableView의 row, gesture등으로 시작하며 끝점은 진행될 다음 ViewController입니다.  
- segue는 일반적으로 다음 ViewController로 진행되는 것을 가르키나, unwind segue를 통해 ViewController를 닫는 역할도 할 수 있습니다.

### Modifying a Segue’s Behavior at Runtime  
![Modifying a Segue’s Behavior at Runtime] (https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/Art/VCPG_displaying-view-controller-using-segue_9-4_2x.png)



### Unwind Segue  
1. 되돌아갈 ViewController 선택
2. 선택된 ViewController에 다음 메소드 정의  
```- (IBAction)myUnwindAction:(UIStroyboardSegue *)unwindSegue ```
3. unwind Segue 액션이 필요한 뷰컨르롤러에 액션과 Exit연결

### Manual Segue  
```[self performSegueWithIdentifier:@"segueName" sender:self];```

> segue PJ 확인해보면 Unwind Segue, Manual Segue 모두 금방 이해할 수 있을 듯


## Size Class  
> [애플 공식문서 : Size-Class-Specific Layout](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/Size-ClassSpecificLayout.html)  

- interfave Builder는 기본적으로 Size Classes를 사용한다.  
- Size Class는 사용자 인터페이스 요소에 지정된 특성으로 요소의 크기를 구분하여 줍니다.  
- 현재 Size Class를 기반으로 많은 요소를 사용자 정의를 할 수 있습니다. 정의된 내용은 레이아웃이 변경될 때 자동으로 조정됩니다.  
- 다음과 같은 내용을 설정할 수 있습니다.
	- Install or uninstall a view or control.
	- Install or uninstall a constraint.
	- Set the value of select attributes (fonts, layout margin settings, etc.)

### 기기별 Size Class
![기기별 Size Class](http://www.shako.net/blog/content/images/2015/01/size_classes-1.jpg)