//
//  CustomUIView.m
//  Block
//
//  Created by Jeheon Choi on 2017. 3. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CustomUIView.h"

@interface CustomUIView ()

@property BtnClickBlock btnActionBlock;
@property (nonatomic, weak) UILabel *lb;

@end


@implementation CustomUIView


- (instancetype)initWithFrame:(CGRect)frame WithBlock:(BtnClickBlock)btnClickBlock {
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
        self.btnActionBlock = btnClickBlock;
    }
    return self;
    
}


- (void)setViews {
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(35, 10, self.frame.size.width - 70, 30);
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(35, 20 + btn.frame.size.height, self.frame.size.width - 70, 30)];
    [lb setText:@"눌린 횟수 : 0"];
    [lb setTextAlignment:NSTextAlignmentCenter];
    self.lb = lb;
    
    [self addSubview:lb];
}


- (void)selectedBtn:(UIButton *)sender {
    [self.lb setText:self.btnActionBlock()];
}

@end
