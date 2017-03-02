//
//  AssetListView.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 3. 2..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AssetListView.h"
#import "DataCenter.h"

@implementation AssetListView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createSubviews];
    }
    return self;
}


- (void)createSubviews {
//    UIAlertController
}

- (void)updateLayout {
    
//    0, 0, 40*TOTAL_CHARACTER_NUM*4/3, 80
    self.frame = CGRectMake(0, 0, 40*TOTAL_CHARACTER_NUM*4/3, 80);
    
}


//////////////////////////////


//- (UIView *)getCharacterListView {
//    
//    // 스크롤 뷰 속 컨텐츠 뷰 생성 및 Frame 설정
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40*TOTAL_CHARACTER_NUM*4/3, 80)];
//    
//    for (NSInteger i = 0; i < TOTAL_CHARACTER_NUM; i++) {
//        
//        StatusCharacter *character = [[self alloc] init];
//        
//        [view addSubview:character];
//        
//        // 캐릭터 순차적으로 배치
//        character.frame = CGRectMake(40*i*4/3, 25, 20*4/3, 125/3*4/3);      // 원래 캐릭터의 4/3배로 늘림
//        [character setCharacterType:i];
//        
//        // 캐릭터 선택 버튼 위에 투명하게 올림
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setBackgroundColor:[UIColor clearColor]];
//        [btn addTarget:character action:@selector(pickedCharacter:) forControlEvents:UIControlEventTouchUpInside];
//        btn.tag = i;    // tag 값 = 캐릭터 넘버
//        
//        [view addSubview:btn];
//        btn.frame = character.frame;
//        
//        
//        if (i == 0) { // 후엔, i대신 기존에 선택되어있는 캐릭터 받아 옴 (새로 생성시엔 첫번째)
//            
//            UIImageView *pickedImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"characterPick"]];
//            [view addSubview:pickedImg];
//            pickedImg.frame = CGRectMake(btn.center.x - (btn.frame.size.width - 8)/2, 0, btn.frame.size.width - 8, btn.frame.size.width - 10);
//            [pickedImg setContentMode:UIViewContentModeScaleToFill];
//            [DataCenter sharedInstance].pickedImg = pickedImg;
//        }
//    }
//    
//    return view;
//}



@end
