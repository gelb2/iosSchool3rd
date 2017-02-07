//
//  CustomTF.m
//  TextField
//
//  Created by Jeheon Choi on 2017. 2. 6..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CustomTF.h"

@implementation CustomTF


- (instancetype)initWithCentor:(CGPoint)center withFrame:(CGRect)frame
{
    self = [super init];
    if (self)
    {
        [self setFrame:frame];
        
        CGFloat centerX = center.x;
        CGFloat centerY = center.y;
        
        CGFloat frameX = frame.origin.x;
        CGFloat frameY = frame.origin.y;

        [self setBackgroundColor:[UIColor blueColor]];
        
        [self setCenter:CGPointMake(centerX+frameX, centerY+frameY)];
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        
        [self addLabel];
        [self addBtn];
    }
    return self;
}


- (void)addLabel
{
    UILabel *lb = [[UILabel alloc] init];
    [lb setFrame:CGRectMake(0, 0, 200, 30)];
    [lb setCenter:CGPointMake(self.center.x, self.center.y)];
    [lb setText:@"111"];
    lb.backgroundColor = [UIColor redColor];
    [lb setTextAlignment:NSTextAlignmentCenter];
//    [lb setTextColor:[UIColor blackColor]];
    [self addSubview:lb];
}


- (void)addBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(self.frame.size.width + 10, 0, 35, 35)];
    [btn setTitle:@"확인" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

- (void)didSelectedBtn:(UIButton *)sender
{
    
}


@end
