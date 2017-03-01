//
//  StatusCharacter.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "StatusCharacter.h"
#import "DataCenter.h"

#define TOTAL_CHARACTER_NUM 2

@interface StatusCharacter ()

@property NSInteger typeNum;

@property (nonatomic, weak) UIView *hair;
@property (nonatomic, weak) UIView *head;
@property (nonatomic, weak) UIView *body;
@property (nonatomic, weak) UIView *foot;

@end


@implementation StatusCharacter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createCharacterViews];
    }
    return self;
}


- (void)createCharacterViews {
    UIView *hair = [[UIView alloc] init];
    UIView *head = [[UIView alloc] init];
    UIView *body = [[UIView alloc] init];
    UIView *foot = [[UIView alloc] init];
    
    self.hair = hair;
    self.head = head;
    self.body = body;
    self.foot = foot;
    
    [self addSubview:hair];
    [self addSubview:head];
    [self addSubview:body];
    [self addSubview:foot];
}


- (void)setCharacterType:(NSInteger)typeNum {
    self.typeNum = typeNum;
    [self setCharacter];
}




- (void)setCharacter {
    
    self.hair.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/8);
    self.head.frame = CGRectMake(0, self.frame.size.height*2/8, self.frame.size.width, self.frame.size.height*2/8);
    self.body.frame = CGRectMake(0, self.frame.size.height*4/8, self.frame.size.width, self.frame.size.height*3/8);
    self.foot.frame = CGRectMake(0, self.frame.size.height*7/8, self.frame.size.width, self.frame.size.height/8);
    
    switch (self.typeNum) {
        case 0:
            [self.hair setBackgroundColor:[UIColor blackColor]];
            [self.head setBackgroundColor:[UIColor colorWithRed:235/255.0 green:187/255.0 blue:150/255.0 alpha:1]];
            [self.body setBackgroundColor:[UIColor colorWithRed:29/255.0 green:172/255.0 blue:235/255.0 alpha:1]];
            [self.foot setBackgroundColor:[UIColor blackColor]];
            break;
        
        case 1:
            [self.hair setBackgroundColor:[UIColor blackColor]];
            [self.head setBackgroundColor:[UIColor colorWithRed:235/255.0 green:187/255.0 blue:150/255.0 alpha:1]];
            [self.body setBackgroundColor:[UIColor colorWithRed:231/255.0 green:22/255.0 blue:137/255.0 alpha:1]];
            [self.foot setBackgroundColor:[UIColor blackColor]];
            break;
            
        default:
            break;
    }
}

+ (UIView *)getCharacterListView {

    // 스크롤 뷰 속 컨텐츠 뷰 생성 및 Frame 설정
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40*TOTAL_CHARACTER_NUM*4/3, 80)];
    
    for (NSInteger i = 0; i < TOTAL_CHARACTER_NUM; i++) {
        
        StatusCharacter *character = [[self alloc] init];
        
        [view addSubview:character];
        
        // 캐릭터 순차적으로 배치
        character.frame = CGRectMake(40*i*4/3, 25, 20*4/3, 125/3*4/3);      // 원래 캐릭터의 4/3배로 늘림
        [character setCharacterType:i];
        
        // 캐릭터 선택 버튼 위에 투명하게 올림
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:character action:@selector(pickedCharacter:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;    // tag 값 = 캐릭터 넘버
        
        [view addSubview:btn];
        btn.frame = character.frame;

        
        if (i == 0) { // 후엔, i대신 기존에 선택되어있는 캐릭터 받아 옴 (새로 생성시엔 첫번째)
            
            UIImageView *pickedImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"characterPick"]];
            [view addSubview:pickedImg];
            pickedImg.frame = CGRectMake(btn.center.x - (btn.frame.size.width - 8)/2, 0, btn.frame.size.width - 8, btn.frame.size.width - 10);
            [pickedImg setContentMode:UIViewContentModeScaleToFill];
            [DataCenter sharedInstance].pickedImg = pickedImg;
        }
    }
    
    return view;
}

- (void)pickedCharacter:(UIButton *)sender {
    
    NSLog(@"캐릭터 %ld번", sender.tag);
    
    [DataCenter sharedInstance].pickedImg.frame = CGRectMake(sender.center.x - (sender.frame.size.width - 8)/2, 0, sender.frame.size.width - 8, sender.frame.size.width - 10);
}

@end
