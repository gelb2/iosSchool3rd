//
//  main.m
//  Game
//
//  Created by Jeheon Choi on 2017. 1. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h" // Warrior class 파일 import
#import "Wizard.h"
#import "Person.h"


int main(int argc, const char * argv[]) {

/*  객체 생성
 
    객체는 클래스가 실질적인 형태로 주기억장치에 생성된 것
    클래스는 보조기억장치에 파일로 있음
 
//  Warrior *barbarian = [[Warrior alloc] init];
 
    [Warrior alloc];        // 객체 생성 (메모리에 객체 생성), alloc : 메모리에 할당, 주소값 리턴 메소드
    [Wizard alloc];
    [Person alloc];
 
 
    [<클래스이름> alloc];    -> 객체 생성
    [객체 init];           -> 객체 초기화
 
    [[<클래스이름> alloc] init];    -> 객체 생성+초기화
    [<클래스이름> new];             -> 객체 생성+초기화
 
//  [[Person alloc] init];  // 컴퓨터는 객체를 생성하고 초기화 한 후
                            // 객체가 메모리의 어떤 위치에 있는지 주소값을 알려줌
 
    <데이터 타입> *<변수 이름> = <객체의 주소>; -> 객체의 주소값을 담을 변수를 생성해 받음
 
//  Person *baby;    // Person을 담을 수 있는 baby라는 변수를 만든 것
 
 
 
*/
    
//  break point 잡아가며 주소값 할당되는 것 확인해보면 이해하기 쉬움
//  isa 포인터 참조: http://pole2win.tistory.com/entry/Objective-C-objects
    
    
    Person *me = [[Person alloc] init];
    Person *you = [Person new];
                   
    Warrior *barbarian = [[Warrior alloc] init];
    Warrior *frankenstein = [Warrior new];
                   
    Wizard *magician = [[Wizard alloc] init];
    Wizard *witch = [Wizard new];
    

    

    

    
    
/*  프로퍼티 접근
 
    set : .연산자에 =로 대입시키는게 set
    get : .연산자로 그냥 호출하는게 get
 
*/
    
    me.name = @"최제헌";
    you.name = @"박종찬";
    
    barbarian.health = @100;
    barbarian.mana = @150;
    barbarian.physicalPower = @200;
    barbarian.magicalPower = @50;
    barbarian.weapon = @500;
    
    frankenstein.health = @3000;
    frankenstein.mana = @0;
    frankenstein.physicalPower = @20;
    frankenstein.magicalPower = @20;
    frankenstein.weapon = @50;
    
    magician.health = @80;
    magician.mana = @400;
    magician.physicalPower = @200;
    magician.magicalPower = @250;
    magician.weapon = @20;
    
    witch.health = @1000;
    witch.mana = @700;
    witch.physicalPower = @400;
    witch.magicalPower = @400;
    witch.weapon = @1000;
    
    
    
    NSLog(@"My name is %@", me.name);
    NSLog(@"Your name is %@", you.name);
    
    NSLog(@"barbarian의 물리 공격력은 %@입니다.",barbarian.physicalPower);
    NSLog(@"barbarian의 마나는 %@입니다.",barbarian.mana);
    
    NSLog(@"- Witch -");
    NSLog(@"health : %@",witch.health);
    NSLog(@"mana : %@", witch.mana);
    NSLog(@"physicalPower : %@", witch.physicalPower);
    NSLog(@"magicalPower : %@", witch.physicalPower);
    NSLog(@"weapon : %@",witch.weapon);

    


/*  메서드 접근
     
    class 헤더파일(.h)에 메서드 헤더 선언 후
    소스파일(.m)에 메서드 구현부 작성
 
    [객체 메서드] : 메서드 실행
 
*/

    [me shout];
    [me sleep];
    [you eat];
    
    [barbarian physicalAttack];
    [barbarian magicalAttack];
    
    [frankenstein physicalAttack];
    [frankenstein magicalAttack];
    
    [magician physicalAttack];
    [magician magicalAttack];

    [witch physicalAttack];
    [witch magicalAttack];
    
    [me wakeUp:@"6시"];
    [me wakeUp2:@"6시" date:@"1월17일"];

    
    return 0;
}
