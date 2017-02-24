//
//  CustomUINavigationBar.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CustomUINavigationBar.h"

@interface CustomUINavigationBar ()

@property (nonatomic) NSInteger currentNaviType;

@end


@implementation CustomUINavigationBar


- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentNaviType = type;
        [self createCustomNaviBar];
        [self setShadow];
    }
    return self;
}

- (void)setShadow {
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShadowOpacity:1.0];
    [self.layer setShadowRadius:5];
    [self.layer setMasksToBounds:NO];
}

- (void)createCustomNaviBar {
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, self.center.y - 12, 48, 24);
    [leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [leftBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 100;
    [self addSubview:leftBtn];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(self.center.x - 24, self.center.y - 12, 48, 24);
    [centerBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [centerBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    centerBtn.tag = 200;
    [self addSubview:centerBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.frame.size.width - 58, self.center.y - 12, 48, 24);
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [rightBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 300;
    [self addSubview:rightBtn];
    
    
    switch (self.currentNaviType) {
        case HOME:
            [self setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
            [leftBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
            [centerBtn setTitle:@"홈" forState:UIControlStateNormal];
            [rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
            
            break;
            
        case ADD:
            [self setBackgroundColor:[UIColor whiteColor]];
            [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            [centerBtn setTitle:@"NEW" forState:UIControlStateNormal];
            [centerBtn setTitleColor:[UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1] forState:UIControlStateNormal];
            [rightBtn setTitle:@"완료" forState:UIControlStateNormal];
            [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            break;

        case MENU:
            [self setBackgroundColor:[UIColor whiteColor]];
            [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            [centerBtn setTitle:@"메뉴" forState:UIControlStateNormal];
            [centerBtn setTitleColor:[UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1] forState:UIControlStateNormal];

            break;

        default:
            break;
    }
}

- (void)selectedBtn:(UIButton *)sender {
    
    switch (self.currentNaviType) {
        case HOME:
            switch (sender.tag) {
                case 100:   // Menu
                    [self.delegate selectedNaviBarMenuBtn];
                    break;
                case 200:   // Home Title
                    break;
                default:    // rightBtn : 300, Add
                    [self.delegate selectedNaviBarAddBtn];
                    break;
            }
            break;
            
        case ADD:
            switch (sender.tag) {
                case 100:   // Back
                    [self.delegate selectedNaviBarBackBtn];
                    break;
                case 200:
                    break;
                default:    // rightBtn : 300
                    break;
            }
            break;
        case MENU:
            switch (sender.tag) {
                case 100:   // Back
                    [self.delegate selectedNaviBarBackBtn];
                    break;
                case 200:
                    break;
                default:    // rightBtn : 300
                    break;
            }
            break;
    }
}

@end
