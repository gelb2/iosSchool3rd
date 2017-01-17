//
//  Person.m
//  Game
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

//  m파일 : 구현 파일
//  @implementation 과 @end 사이에 메서드 구현

#import "Person.h"

@implementation Person


// 퀵헬프 작성 < 참고링크 http://goo.gl/idJNx7, https://goo.gl/ENEuFd, https://goo.gl/N93iuO >
// 퀵헬프 보기 option + 클릭
// 정의부 점프 command + 클릭

/**
 * 나는 인간이다.
 * 인간은 자고로 소리를 지를 수 있어야지!
 * 자 난 이제 소리지를거야!
 * @discussion 진부한 야호 말고 어떻게 어떻게 소리 지를 수 있을까?
 * @author Jeheon Choi
 * @version 0.1
 * @return nil
 */
- (id)shout {
    NSLog(@"YA~~~~~HO~~~~~!!");
    
    return nil;
}

- (id)sleep {
    NSLog(@"zzZzzzzZZzzZzz");

    return nil;
}

- (void)eat {
    NSLog(@"Um.. yummy yummy~");

}



// 반대로 소스파일엔 있으나
// 헤더파일에 없는 경우는 에러 안 뜸.
// Why?
// 헤더파일은 소스파일을 모른다.

- (id)walk {
    NSLog(@"Um.. yummy yummy~");
    
    return nil;
}


- (id)wakeUp:(id)time{
    NSLog(@"시간은 %@",time);
    
    return nil;
}

- (id)wakeUp2:(id)time date:(id)date {
    NSLog(@"시간은 %@",time);
    NSLog(@"날짜는 %@",date);

    return nil;
}

@end
