//
//  ViewController.m
//  Day17
//
//  Created by Jeheon Choi on 2017. 2. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIImageView *profileImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    // 1번 Skip
//    
//    // 2번
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    view1.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:view1];
//
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-48, self.view.frame.size.width, 48)];
//    view2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view2];
//    
//
//    // 3번
//    UIView *view3 = [[UIView alloc] init];
//    view3.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
//    view3.bounds = CGRectMake(0, 0, 110, 110);
//    [self.view addSubview:view3];
//    
//    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
//    view4.backgroundColor = [UIColor greenColor];
//    [view3 addSubview:view4];
//    
//    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 10, 100)];
//    view5.backgroundColor = [UIColor yellowColor];
//    [view3 addSubview:view5];
//    
//    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 10, 100)];
//    view6.backgroundColor = [UIColor purpleColor];
//    [view3 addSubview:view6];
//    
//    UIView *view7 = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 10)];
//    view7.backgroundColor = [UIColor orangeColor];
//    [view3 addSubview:view7];
//    
//    
//    
//    // 4번
//    UIView *view8 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 80)];
//    view8.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view8];
//    
//    UIView *view9 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
//    view9.backgroundColor = [UIColor blackColor];
//    [view8 addSubview:view9];
//    
//    UIView *view10 = [[UIView alloc] initWithFrame:CGRectMake(view9.frame.size.width + 20, 10, self.view.frame.size.width - view9.frame.size.width - 30, 40)];
//    view10.backgroundColor = [UIColor cyanColor];
//    [view8 addSubview:view10];
//    
//    UIView *view11 = [[UIView alloc] initWithFrame:CGRectMake(view9.frame.size.width + 20, view10.frame.size.height + 20, self.view.frame.size.width - view9.frame.size.width - 30, 10)];
//    view11.backgroundColor = [UIColor brownColor];
//    [view8 addSubview:view11];
    
    
    // 5번 (fb 타임라인 비슷)
    
    // profileView
    UIView *profileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 268)];
    profileView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:profileView];
    
        // coverImgView
        UIImageView *coverImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, profileView.frame.size.width, 168)];
        UIImage *coverImg = [UIImage imageNamed:@"Images/pokemonCoverImg.jpg"];
        coverImgView.image = coverImg;
        [coverImgView setContentMode:UIViewContentModeScaleAspectFill];
        coverImgView.alpha = 0.6;
        coverImgView.clipsToBounds = YES;
        [profileView addSubview:coverImgView];
        
        // profileImgView
        UIImageView *profileImgView = [[UIImageView alloc] initWithFrame:CGRectMake(profileView.frame.size.width/2 - 40, coverImgView.frame.size.height - 40, 80, 80)];
        UIImage *profileImg = [UIImage imageNamed:@"Images/pikachu.png"];
        profileImgView.image = profileImg;
        [profileImgView setHighlightedImage:[UIImage imageNamed:@"Images/pikachu_highlighted.jpg"]];
//        profileImgView.highlighted = YES;
        [profileImgView setContentMode:UIViewContentModeScaleAspectFit];
        [profileImgView.layer setBorderColor:[UIColor colorWithRed:0xE0/255.0 green:0xE0/255.0 blue:0xE0/255.0 alpha:1].CGColor];
        profileImgView.layer.borderWidth = 2.0f;

        [profileView addSubview:profileImgView];
        
        // profileNameLabel
        UILabel *profileNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileView.frame.size.width/2 - 40, coverImgView.frame.size.height + profileImgView.frame.size.height/2 + 3, 80, 25)];
        [profileNameLabel setText:@"피카츄"];
        [profileNameLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [profileNameLabel setTextAlignment:NSTextAlignmentCenter];
        [profileView addSubview: profileNameLabel];
        
        // profileFreeTalkLabel
        UILabel *profileFreeTalkLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileView.frame.size.width/2 - 40, coverImgView.frame.size.height + profileImgView.frame.size.height/2 + profileNameLabel.frame.size.height + 5, 80, 13)];
        [profileFreeTalkLabel setText:@"Pika Pika"];
        [profileFreeTalkLabel setFont:[UIFont italicSystemFontOfSize:14]];
        [profileFreeTalkLabel setTextColor:[UIColor orangeColor]];
        [profileFreeTalkLabel setTextAlignment:NSTextAlignmentCenter];
        [profileView addSubview: profileFreeTalkLabel];
    

    
    // menuView
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(0, profileView.frame.size.height, self.view.frame.size.width, 45)];
    [self.view addSubview:menuView];
    
        // menu1
        UIView *menu1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, menuView.frame.size.width/4, menuView.frame.size.height)];
//        menu1.backgroundColor = [UIColor redColor];
        menu1.backgroundColor = [UIColor colorWithRed:0xF9/255.0 green:0x43/255.0 blue:0x60/255.0 alpha:0.7];
        [menuView addSubview:menu1];
//        [menu1.layer setBorderColor:[UIColor orangeColor].CGColor];
//        menu1.layer.borderWidth = 3.0f;
    
        UIImageView *menu1ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, menu1.frame.size.width - 10, menu1.frame.size.height - 25)];
        [menu1ImgView setImage:[UIImage imageNamed:@"Images/home.png"]];
        [menu1ImgView setContentMode:UIViewContentModeScaleAspectFit];
        [menu1 addSubview:menu1ImgView];
        
        UILabel *menu1NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, menu1ImgView.frame.size.height + 10, menu1.frame.size.width - 10, menu1.frame.size.height - menu1ImgView.frame.size.height - 15)];
        [menu1NameLabel setText:@"홈"];
        [menu1NameLabel setFont:[UIFont systemFontOfSize:12]];
//        menu1NameLabel.adjustsFontSizeToFitWidth = YES;
        [menu1NameLabel setTextAlignment:NSTextAlignmentCenter];
        [menu1 addSubview: menu1NameLabel];
        
        
        // menu2
        UIView *menu2 = [[UIView alloc] initWithFrame:CGRectMake(menuView.frame.size.width/4, 0, menuView.frame.size.width/4, menuView.frame.size.height)];
        menu2.backgroundColor = [UIColor colorWithRed:0xfd/255.0 green:0x80/255.0 blue:0x23/255.0 alpha:0.8];
        [menuView addSubview:menu2];
//        [menu2.layer setBorderColor:[UIColor yellowColor].CGColor];
//        menu2.layer.borderWidth = 3.0f;
    
        UIImageView *menu2ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, menu2.frame.size.width - 10, menu2.frame.size.height - 25)];
        [menu2ImgView setImage:[UIImage imageNamed:@"Images/pokeball.png"]];
        [menu2ImgView setContentMode:UIViewContentModeScaleAspectFit];
        [menu2 addSubview:menu2ImgView];
        
        UILabel *menu2NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, menu2ImgView.frame.size.height + 10, menu2.frame.size.width - 10, menu2.frame.size.height - menu2ImgView.frame.size.height - 15)];
        [menu2NameLabel setText:@"포켓몬"];
        [menu2NameLabel setFont:[UIFont systemFontOfSize:12]];
        [menu2NameLabel setTextAlignment:NSTextAlignmentCenter];
        [menu2 addSubview: menu2NameLabel];

        
        // menu3
        UIView *menu3 = [[UIView alloc] initWithFrame:CGRectMake(menuView.frame.size.width/4*2, 0, menuView.frame.size.width/4, menuView.frame.size.height)];
        menu3.backgroundColor = [UIColor colorWithRed:0xfd/255.0 green:0x80/255.0 blue:0x23/255.0 alpha:0.8];
    
        [menuView addSubview:menu3];
//        [menu3.layer setBorderColor:[UIColor yellowColor].CGColor];
//        menu3.layer.borderWidth = 3.0f;
    
        UIImageView *menu3ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, menu3.frame.size.width - 10, menu3.frame.size.height - 25)];
        [menu3ImgView setImage:[UIImage imageNamed:@"Images/pokemap.png"]];
        [menu3ImgView setContentMode:UIViewContentModeScaleAspectFit];
        [menu3 addSubview:menu3ImgView];
        
        UILabel *menu3NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, menu3ImgView.frame.size.height + 10, menu3.frame.size.width - 10, menu3.frame.size.height - menu3ImgView.frame.size.height - 15)];
        [menu3NameLabel setText:@"지도"];
        [menu3NameLabel setFont:[UIFont systemFontOfSize:12]];
        [menu3NameLabel setTextAlignment:NSTextAlignmentCenter];
        [menu3 addSubview: menu3NameLabel];
        

        // menu4
        UIView *menu4 = [[UIView alloc] initWithFrame:CGRectMake(menuView.frame.size.width/4*3, 0, menuView.frame.size.width/4, menuView.frame.size.height)];
        menu4.backgroundColor = [UIColor colorWithRed:0xaa/255.0 green:0xaa/255.0 blue:0xaa/255.0 alpha:0.8];
        [menuView addSubview:menu4];
//        [menu4.layer setBorderColor:[UIColor colorWithRed:0xFF/255.0 green:0xFF/255.0 blue:0xFF/255.0 alpha:1].CGColor];
//        menu4.layer.borderWidth = 3.0f;
    
    
        UIImageView *menu4ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, menu4.frame.size.width - 10, menu4.frame.size.height - 25)];
        [menu4ImgView setImage:[UIImage imageNamed:@"Images/setting.png"]];
        [menu4ImgView setContentMode:UIViewContentModeScaleAspectFit];
        [menu4 addSubview:menu4ImgView];
        
        UILabel *menu4NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, menu4ImgView.frame.size.height + 10, menu4.frame.size.width - 10, menu4.frame.size.height - menu4ImgView.frame.size.height - 15)];
        [menu4NameLabel setText:@"설정"];
        [menu4NameLabel setFont:[UIFont systemFontOfSize:12]];
        [menu4NameLabel setTextAlignment:NSTextAlignmentCenter];
        [menu4 addSubview: menu4NameLabel];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 0, 100, 35);
    testBtn.center = CGPointMake(self.view.frame.size.width/2, menuView.frame.origin.y + menuView.frame.size.height + 150);
    [testBtn setTitle:@"눌러줭" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn setTitle:@"놓아죠" forState:UIControlStateHighlighted];
    [testBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [testBtn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    
}

- (void)didSelectedBtn:(UIButton *)sender {
    NSLog(@"버튼을 클릭했습니다.");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
