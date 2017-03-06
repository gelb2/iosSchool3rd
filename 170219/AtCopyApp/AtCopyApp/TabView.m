//
//  TabView.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 3. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "TabView.h"

@interface TabView ()

@property UIButton *lastSelectedBtn;
@property UIView *redLine;

@end


@implementation TabView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviewsAndUpdateLayout];
    }
    return self;
}


- (void)createSubviewsAndUpdateLayout {
    
    // 버튼 1
    UIButton *tabButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton1.frame = CGRectMake(0, 0, self.frame.size.width/3, self.frame.size.height);
    [tabButton1 setTitle:@"시간" forState:UIControlStateNormal];
    [tabButton1 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
    [tabButton1.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton1 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton1.tag = 0;
    [self addSubview:tabButton1];
    
    self.lastSelectedBtn = tabButton1;      // 초기 선택된 버튼 : tabButton1
    
    
    // 버튼 2
    UIButton *tabButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton2.frame = CGRectMake(self.frame.size.width/3, 0, self.frame.size.width/3, self.frame.size.height);
    [tabButton2 setTitle:@"커스텀" forState:UIControlStateNormal];
    [tabButton2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton2.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton2 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton2.tag = 1;
    [self addSubview:tabButton2];

    
    // 버튼 2
    UIButton *tabButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    tabButton3.frame = CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width/3, self.frame.size.height);
    [tabButton3 setTitle:@"더보기" forState:UIControlStateNormal];
    [tabButton3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tabButton3.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [tabButton3 addTarget:self action:@selector(selectedTabBtn:) forControlEvents:UIControlEventTouchUpInside];
    tabButton3.tag = 2;
    [self addSubview:tabButton3];
    

    // Selected Red Line
    UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(10, self.frame.size.height - 4.5, self.frame.size.width/3 - 20, 4)];
    [redLine setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
    [self addSubview:redLine];
    self.redLine = redLine;
    
    // Cell SeparatorLine
    UIView *separatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
    [separatorLine setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:separatorLine];
    
}


- (void)selectedTabBtn:(UIButton *)sender {

    // 이전 버튼 색 초기화
    [self.lastSelectedBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.lastSelectedBtn = sender;      // 다시 마지막으로 선택된 버튼 세팅
    
    switch (sender.tag) {
        case 0: {
            [sender setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                self.redLine.frame = CGRectMake(10, self.frame.size.height - 4.5, self.frame.size.width/3 - 20, 4);
            }];
            
            [self.delegate selectedTabViewLeftBtn:sender];
        }
            break;
        case 1: {
            [sender setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                self.redLine.frame = CGRectMake(10 + self.frame.size.width/3, self.frame.size.height - 4.5, self.frame.size.width/3 - 20, 4);
            }];
            [self.delegate selectedTabViewMiddleBtn:sender];
        }
            break;
        default: {
            [sender setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                self.redLine.frame = CGRectMake(10 + self.frame.size.width*2/3, self.frame.size.height - 4.5, self.frame.size.width/3 - 20, 4);
            }];
            [self.delegate selectedTabViewRightBtn:sender];
        }
            break;
    }
}

@end
