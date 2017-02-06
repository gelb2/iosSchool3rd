//
//  ViewController.m
//  PokemonBack
//
//  Created by Jeheon Choi on 2017. 2. 5..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "ItemBtn.h"

@interface ViewController ()


@property NSInteger myCoin;
@property UILabel *myCoinLabel;
@property UILabel *stateLabel;

@property CGFloat realMoney;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myCoin = 50;
    self.realMoney = 0;

    
    // Shop Scroll View
    
    UIScrollView *shopScrView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:shopScrView];
    
    

    
    // Top View
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, shopScrView.frame.size.width, 125)];
    topView.backgroundColor = [UIColor colorWithRed:250/255.0 green:255/255.0 blue:250/255.0 alpha:1];
//    topView.backgroundColor = [UIColor redColor];
    [shopScrView addSubview:topView];
    
    UILabel *shopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, topView.frame.size.width, 20)];
    shopLabel.text = @"SHOP";
    [shopLabel setFont:[UIFont systemFontOfSize:15]];
    [shopLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [shopLabel setTextAlignment:NSTextAlignmentCenter];
    [topView addSubview:shopLabel];
    
    UIView *shoplineView = [[UIView alloc] initWithFrame:CGRectMake(topView.frame.size.width/2 - 30, 60, 60, 2)];
    shoplineView.backgroundColor = [UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8];
    [topView addSubview:shoplineView];
    
    
//    UILabel *myCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(topView.frame.size.width/2, 70, 60, 30)];
//    [myCoinLabel setFrame:CGRectMake(topView.frame.size.width/2, 70, 60, 30)];
//    [myCoinLabel setText:[NSString stringWithFormat:@"%ld",self.myCoin]];
//    [myCoinLabel setFont:[UIFont boldSystemFontOfSize:25]];
//    [myCoinLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
//    [myCoinLabel setTextAlignment:NSTextAlignmentLeft];
//    [topView addSubview:myCoinLabel];

    self.myCoinLabel = [[UILabel alloc] init];
    [self.myCoinLabel setFrame:CGRectMake(topView.frame.size.width/2, 70, 200, 30)];
    [self.myCoinLabel setText:[NSString stringWithFormat:@"%ld",self.myCoin]];
    [self.myCoinLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [self.myCoinLabel setTextAlignment:NSTextAlignmentLeft];
    [topView addSubview:self.myCoinLabel];
    
    UIImageView *myCoinImgView = [[UIImageView alloc] initWithFrame:CGRectMake(topView.frame.size.width/2-35, 70, 30, 30)];
    [myCoinImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [myCoinImgView setContentMode:UIViewContentModeScaleAspectFit];
    [topView addSubview:myCoinImgView];
    
    
    
    // Items View = 도구
    UIView *itemsView = [[UIView alloc] initWithFrame:CGRectMake(0, topView.frame.size.height, shopScrView.frame.size.width, 340)];
    itemsView.backgroundColor = [UIColor colorWithRed:250/255.0 green:255/255.0 blue:250/255.0 alpha:1];
//    itemsView.backgroundColor = [UIColor blueColor];
    [shopScrView addSubview:itemsView];
    
    // - Name Line View
    UIView *itemsNameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemsView.frame.size.width, 10)];
    [itemsView addSubview:itemsNameView];
    
    UIView *itemslineView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 4, itemsNameView.frame.size.width/2 - 30, 1)];
    itemslineView1.backgroundColor = [UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.4];
    //[UIColor colorWithRed:299/255.0 green:233/255.0 blue:229/255.0 alpha:1];
    [itemsNameView addSubview:itemslineView1];
    
    UILabel *itemsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(itemsNameView.frame.size.width/2 - 20, 0, 40, 10)];
    itemsNameLabel.text = @"ITEMS";
    [itemsNameLabel setFont:[UIFont systemFontOfSize:10]];
    [itemsNameLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.5]];
    [itemsNameLabel setTextAlignment:NSTextAlignmentCenter];
    [itemsNameView addSubview:itemsNameLabel];
    
    UIView *itemslineView2 = [[UIView alloc] initWithFrame:CGRectMake(itemsNameView.frame.size.width/2 + 20, itemslineView1.frame.origin.y, itemslineView1.frame.size.width, itemslineView1.frame.size.height)];
    itemslineView2.backgroundColor = [UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.4];
    [itemsNameView addSubview:itemslineView2];
    

    // - item1 View
    UIView *item1View = [[UIView alloc] initWithFrame:CGRectMake(0, itemsNameView.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item1View];
    
    UIImageView *item1ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item1View.frame.size.width, 100)];
    [item1ImgView setImage:[UIImage imageNamed:@"Images/pokeballs20.png"]];
    [item1ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item1View addSubview:item1ImgView];
    
    UILabel *item1Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item1ImgView.frame.size.height, item1View.frame.size.width, 25)];
    item1Label.text = @"20 POKÉ BALLS";
    [item1Label setFont:[UIFont systemFontOfSize:11]];
    [item1Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item1Label setTextAlignment:NSTextAlignmentCenter];
    [item1View addSubview:item1Label];
    
    // - - item1BtnView
    UIView *item1BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item1ImgView.frame.size.height + item1Label.frame.size.height + 4, item1View.frame.size.width - 40, 20)];
    item1BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item1BtnView.layer setCornerRadius:3];
    [item1View addSubview:item1BtnView];
    
    ItemBtn *item1Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item1Btn.frame = CGRectMake(0, 0, item1View.frame.size.width - 40, 20);
    [item1Btn setTitle:@"  100" forState:UIControlStateNormal];
    item1Btn.value = -100;
    [item1Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item1Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item1Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    //    [item1Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item1Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item1Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item1Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item1BtnView addSubview:item1Btn];
    
    
    UIImageView *item1BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item1BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item1BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item1BtnView addSubview:item1BtnImgView];
    
    
    
    // - item2 View
    UIView *item2View = [[UIView alloc] initWithFrame:CGRectMake(itemsView.frame.size.width/3, itemsNameView.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item2View];
    
    UIImageView *item2ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item2View.frame.size.width, 100)];
    [item2ImgView setImage:[UIImage imageNamed:@"Images/pokeballs100.png"]];
    [item2ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item2View addSubview:item2ImgView];
    
    UILabel *item2Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item2ImgView.frame.size.height, item2View.frame.size.width, 25)];
    item2Label.text = @"100 POKÉ BALLS";
    [item2Label setFont:[UIFont systemFontOfSize:11]];
    [item2Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item2Label setTextAlignment:NSTextAlignmentCenter];
    [item2View addSubview:item2Label];
    
    // - - item2BtnView
    UIView *item2BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item2ImgView.frame.size.height + item2Label.frame.size.height + 4, item2View.frame.size.width - 40, 20)];
    item2BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item2BtnView.layer setCornerRadius:3];
    [item2View addSubview:item2BtnView];
    
    ItemBtn *item2Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item2Btn.frame = CGRectMake(0, 0, item2View.frame.size.width - 40, 20);
    [item2Btn setTitle:@"  460" forState:UIControlStateNormal];
    item2Btn.value = -460;
    [item2Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item2Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item2Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    //    [item2Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item2Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item2Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item2Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item2BtnView addSubview:item2Btn];
    
    
    UIImageView *item2BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item2BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item2BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item2BtnView addSubview:item2BtnImgView];
    
    
    
    // - item3 View
    UIView *item3View = [[UIView alloc] initWithFrame:CGRectMake(itemsView.frame.size.width/3*2, itemsNameView.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item3View];
    
    UIImageView *item3ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item3View.frame.size.width, 100)];
    [item3ImgView setImage:[UIImage imageNamed:@"Images/pokeballs200.png"]];
    [item3ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item3View addSubview:item3ImgView];
    
    UILabel *item3Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item3ImgView.frame.size.height, item3View.frame.size.width, 25)];
    item3Label.text = @"200 POKÉ BALLS";
    [item3Label setFont:[UIFont systemFontOfSize:11]];
    [item3Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item3Label setTextAlignment:NSTextAlignmentCenter];
    [item3View addSubview:item3Label];
    
    // - - item3BtnView
    UIView *item3BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item3ImgView.frame.size.height + item3Label.frame.size.height + 4, item3View.frame.size.width - 40, 20)];
    item3BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item3BtnView.layer setCornerRadius:3];
    [item3View addSubview:item3BtnView];
    
    ItemBtn *item3Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item3Btn.frame = CGRectMake(0, 0, item3View.frame.size.width - 40, 20);
    [item3Btn setTitle:@"  800" forState:UIControlStateNormal];
    item3Btn.value = -800;
    [item3Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item3Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item3Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
//    [item3Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
//    [item3Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
//    [item3Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item3Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item3BtnView addSubview:item3Btn];
    
    
    UIImageView *item3BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item3BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item3BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item3BtnView addSubview:item3BtnImgView];
    
    
    // - item4 View
    UIView *item4View = [[UIView alloc] initWithFrame:CGRectMake(0, itemsNameView.frame.size.height + item1View.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item4View];
    
    UIImageView *item4ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item4View.frame.size.width, 100)];
    [item4ImgView setImage:[UIImage imageNamed:@"Images/incense1.png"]];
    [item4ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item4View addSubview:item4ImgView];
    
    UILabel *item4Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item4ImgView.frame.size.height, item4View.frame.size.width, 25)];
    item4Label.text = @"INCENSE";
    [item4Label setFont:[UIFont systemFontOfSize:11]];
    [item4Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item4Label setTextAlignment:NSTextAlignmentCenter];
    [item4View addSubview:item4Label];
    
    // - - item4BtnView 버튼 이해 부족..
    UIView *item4BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item4ImgView.frame.size.height + item4Label.frame.size.height + 4, item4View.frame.size.width - 40, 20)];
    item4BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item4BtnView.layer setCornerRadius:3];
    [item4View addSubview:item4BtnView];
    
    ItemBtn *item4Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item4Btn.frame = CGRectMake(0, 0, item4View.frame.size.width - 40, 20);
    [item4Btn setTitle:@"  80" forState:UIControlStateNormal];
    item4Btn.value = -80;
    [item4Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item4Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item4Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    //    [item4Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item4Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item4Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item4Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item4BtnView addSubview:item4Btn];
    
    
    UIImageView *item4BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item4BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item4BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item4BtnView addSubview:item4BtnImgView];
    
    
    
    // - item5 View
    UIView *item5View = [[UIView alloc] initWithFrame:CGRectMake(itemsView.frame.size.width/3, itemsNameView.frame.size.height + item1View.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item5View];
    
    UIImageView *item5ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item5View.frame.size.width, 100)];
    [item5ImgView setImage:[UIImage imageNamed:@"Images/incense8.png"]];
    [item5ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item5View addSubview:item5ImgView];
    
    UILabel *item5Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item5ImgView.frame.size.height, item5View.frame.size.width, 25)];
    item5Label.text = @"8 INCENSE";
    [item5Label setFont:[UIFont systemFontOfSize:11]];
    [item5Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item5Label setTextAlignment:NSTextAlignmentCenter];
    [item5View addSubview:item5Label];
    
    // - - item5BtnView 버튼 이해 부족..
    UIView *item5BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item5ImgView.frame.size.height + item5Label.frame.size.height + 4, item5View.frame.size.width - 40, 20)];
    item5BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item5BtnView.layer setCornerRadius:3];
    [item5View addSubview:item5BtnView];
    
    ItemBtn *item5Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item5Btn.frame = CGRectMake(0, 0, item5View.frame.size.width - 40, 20);
    [item5Btn setTitle:@"  500" forState:UIControlStateNormal];
    item5Btn.value = -500;
    [item5Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item5Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item5Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    //    [item5Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item5Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item5Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item5Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item5BtnView addSubview:item5Btn];
    
    
    UIImageView *item5BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item5BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item5BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item5BtnView addSubview:item5BtnImgView];
    
    
    
    // - item6 View
    UIView *item6View = [[UIView alloc] initWithFrame:CGRectMake(itemsView.frame.size.width/3*2, itemsNameView.frame.size.height + item1View.frame.size.height, itemsView.frame.size.width/3, 150)];
    [itemsView addSubview:item6View];
    
    UIImageView *item6ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item6View.frame.size.width, 100)];
    [item6ImgView setImage:[UIImage imageNamed:@"Images/incense25.png"]];
    [item6ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item6View addSubview:item6ImgView];
    
    UILabel *item6Label = [[UILabel alloc] initWithFrame:CGRectMake(0, item6ImgView.frame.size.height, item6View.frame.size.width, 25)];
    item6Label.text = @"25 INCENSE";
    [item6Label setFont:[UIFont systemFontOfSize:11]];
    [item6Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [item6Label setTextAlignment:NSTextAlignmentCenter];
    [item6View addSubview:item6Label];
    
    // - - item6BtnView 버튼 이해 부족..
    UIView *item6BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, item6ImgView.frame.size.height + item6Label.frame.size.height + 4, item6View.frame.size.width - 40, 20)];
    item6BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [item6BtnView.layer setCornerRadius:3];
    [item6View addSubview:item6BtnView];
    
    ItemBtn *item6Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    item6Btn.frame = CGRectMake(0, 0, item6View.frame.size.width - 40, 20);
    [item6Btn setTitle:@" 1250" forState:UIControlStateNormal];
    item6Btn.value = -1250;
    [item6Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [item6Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [item6Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    //    [item6Btn setImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item6Btn setBackgroundImage:[UIImage imageNamed:@"Images/pokecoin.png"] forState:UIControlStateNormal];
    //    [item6Btn setContentMode:UIViewContentModeScaleAspectFit];
    [item6Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [item6BtnView addSubview:item6Btn];
    
    
    UIImageView *item6BtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 15, 15)];
    [item6BtnImgView setImage:[UIImage imageNamed:@"Images/pokecoin.png"]];
    [item6BtnImgView setContentMode:UIViewContentModeScaleAspectFit];
    [item6BtnView addSubview:item6BtnImgView];
    
    
    /////////////////////////////////////////////////////////
    
    
    // coins View
    UIView *coinsView = [[UIView alloc] initWithFrame:CGRectMake(0, topView.frame.size.height + itemsView.frame.size.height, shopScrView.frame.size.width, 340)];
    coinsView.backgroundColor = [UIColor colorWithRed:250/255.0 green:255/255.0 blue:250/255.0 alpha:1];
//    coinsView.backgroundColor = [UIColor blackColor];
    [shopScrView addSubview:coinsView];
    
    // - Name Line View
    UIView *coinsNameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, coinsView.frame.size.width, 10)];
    [coinsView addSubview:coinsNameView];
    
    UIView *coinslineView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 4, coinsNameView.frame.size.width/2 - 45, 1)];
    coinslineView1.backgroundColor = [UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.4];
    //[UIColor colorWithRed:299/255.0 green:233/255.0 blue:229/255.0 alpha:1];
    [coinsNameView addSubview:coinslineView1];
    
    UILabel *coinsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(coinsNameView.frame.size.width/2 - 30, 0, 60, 10)];
    coinsNameLabel.text = @"POKECOINS";
    [coinsNameLabel setFont:[UIFont systemFontOfSize:10]];
    [coinsNameLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.5]];
    [coinsNameLabel setTextAlignment:NSTextAlignmentCenter];
    [coinsNameView addSubview:coinsNameLabel];
    
    UIView *coinslineView2 = [[UIView alloc] initWithFrame:CGRectMake(coinsNameView.frame.size.width/2 + 35, coinslineView1.frame.origin.y, coinslineView1.frame.size.width, coinslineView1.frame.size.height)];
    coinslineView2.backgroundColor = [UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.4];
    [coinsNameView addSubview:coinslineView2];
    
    
    // - coin1 View
    UIView *coin1View = [[UIView alloc] initWithFrame:CGRectMake(0, coinsNameView.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin1View];
    
    UIImageView *coin1ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin1View.frame.size.width, 100)];
    [coin1ImgView setImage:[UIImage imageNamed:@"Images/pokecoin100.png"]];
    [coin1ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin1View addSubview:coin1ImgView];
    
    UILabel *coin1Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin1ImgView.frame.size.height, coin1View.frame.size.width, 25)];
    coin1Label.text = @"100 POKÉCOINS";
    [coin1Label setFont:[UIFont systemFontOfSize:10]];
    [coin1Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin1Label setTextAlignment:NSTextAlignmentCenter];
    [coin1View addSubview:coin1Label];
    
    // - - coin1BtnView
    UIView *coin1BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin1ImgView.frame.size.height + coin1Label.frame.size.height + 4, coin1View.frame.size.width - 40, 20)];
    coin1BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin1BtnView.layer setCornerRadius:3];
    [coin1View addSubview:coin1BtnView];
    
    ItemBtn *coin1Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin1Btn.frame = CGRectMake(0, 0, coin1View.frame.size.width - 40, 20);
    [coin1Btn setTitle:@"US$1.09" forState:UIControlStateNormal];
    coin1Btn.value = 100;
    [coin1Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin1Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin1Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin1Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin1BtnView addSubview:coin1Btn];

    
    
    // - coin2 View
    UIView *coin2View = [[UIView alloc] initWithFrame:CGRectMake(coinsView.frame.size.width/3, coinsNameView.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin2View];
    
    UIImageView *coin2ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin2View.frame.size.width, 100)];
    [coin2ImgView setImage:[UIImage imageNamed:@"Images/pokecoin500.png"]];
    [coin2ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin2View addSubview:coin2ImgView];
    
    UILabel *coin2Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin2ImgView.frame.size.height, coin2View.frame.size.width, 25)];
    coin2Label.text = @"500 POKÉCOINS";
    [coin2Label setFont:[UIFont systemFontOfSize:10]];
    [coin2Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin2Label setTextAlignment:NSTextAlignmentCenter];
    [coin2View addSubview:coin2Label];
    
    // - - coin2BtnView
    UIView *coin2BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin2ImgView.frame.size.height + coin2Label.frame.size.height + 4, coin2View.frame.size.width - 40, 20)];
    coin2BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin2BtnView.layer setCornerRadius:3];
    [coin2View addSubview:coin2BtnView];
    
    ItemBtn *coin2Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin2Btn.frame = CGRectMake(0, 0, coin2View.frame.size.width - 40, 20);
    [coin2Btn setTitle:@"US$5.49" forState:UIControlStateNormal];
    coin2Btn.value = 500;
    [coin2Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin2Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin2Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin2Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin2BtnView addSubview:coin2Btn];
    
    
    
    // - coin3 View
    UIView *coin3View = [[UIView alloc] initWithFrame:CGRectMake(coinsView.frame.size.width/3*2, coinsNameView.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin3View];
    
    UIImageView *coin3ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin3View.frame.size.width, 100)];
    [coin3ImgView setImage:[UIImage imageNamed:@"Images/pokecoin1200.png"]];
    [coin3ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin3View addSubview:coin3ImgView];
    
    UILabel *coin3Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin3ImgView.frame.size.height, coin3View.frame.size.width, 25)];
    coin3Label.text = @"1,200 POKÉCOINS";
    [coin3Label setFont:[UIFont systemFontOfSize:10]];
    [coin3Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin3Label setTextAlignment:NSTextAlignmentCenter];
    [coin3View addSubview:coin3Label];
    
    // - - coin3BtnView
    UIView *coin3BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin3ImgView.frame.size.height + coin3Label.frame.size.height + 4, coin3View.frame.size.width - 40, 20)];
    coin3BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin3BtnView.layer setCornerRadius:3];
    [coin3View addSubview:coin3BtnView];
    
    ItemBtn *coin3Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin3Btn.frame = CGRectMake(0, 0, coin3View.frame.size.width - 40, 20);
    [coin3Btn setTitle:@"US$10.99" forState:UIControlStateNormal];
    coin3Btn.value = 1200;
    [coin3Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin3Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin3Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin3Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin3BtnView addSubview:coin3Btn];
    

    // - coin4 View
    UIView *coin4View = [[UIView alloc] initWithFrame:CGRectMake(0, coinsNameView.frame.size.height + coin1View.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin4View];
    
    UIImageView *coin4ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin4View.frame.size.width, 100)];
    [coin4ImgView setImage:[UIImage imageNamed:@"Images/pokecoin2500.png"]];
    [coin4ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin4View addSubview:coin4ImgView];
    
    UILabel *coin4Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin4ImgView.frame.size.height, coin4View.frame.size.width, 25)];
    coin4Label.text = @"2,500 POKÉCOINS";
    [coin4Label setFont:[UIFont systemFontOfSize:10]];
    [coin4Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin4Label setTextAlignment:NSTextAlignmentCenter];
    [coin4View addSubview:coin4Label];
    
    // - - coin4BtnView
    UIView *coin4BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin4ImgView.frame.size.height + coin4Label.frame.size.height + 4, coin4View.frame.size.width - 40, 20)];
    coin4BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin4BtnView.layer setCornerRadius:3];
    [coin4View addSubview:coin4BtnView];
    
    ItemBtn *coin4Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin4Btn.frame = CGRectMake(0, 0, coin4View.frame.size.width - 40, 20);
    [coin4Btn setTitle:@"US$21.99" forState:UIControlStateNormal];
    coin4Btn.value = 2500;
    [coin4Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin4Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin4Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin4Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin4BtnView addSubview:coin4Btn];
    
    
    
    // - coin5 View
    UIView *coin5View = [[UIView alloc] initWithFrame:CGRectMake(coinsView.frame.size.width/3, coinsNameView.frame.size.height + coin1View.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin5View];
    
    UIImageView *coin5ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin5View.frame.size.width, 100)];
    [coin5ImgView setImage:[UIImage imageNamed:@"Images/pokecoin5200.png"]];
    [coin5ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin5View addSubview:coin5ImgView];
    
    UILabel *coin5Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin5ImgView.frame.size.height, coin5View.frame.size.width, 25)];
    coin5Label.text = @"5,200 POKÉCOINS";
    [coin5Label setFont:[UIFont systemFontOfSize:10]];
    [coin5Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin5Label setTextAlignment:NSTextAlignmentCenter];
    [coin5View addSubview:coin5Label];
    
    // - - coin5BtnView
    UIView *coin5BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin5ImgView.frame.size.height + coin5Label.frame.size.height + 4, coin5View.frame.size.width - 40, 20)];
    coin5BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin5BtnView.layer setCornerRadius:3];
    [coin5View addSubview:coin5BtnView];
    
    ItemBtn *coin5Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin5Btn.frame = CGRectMake(0, 0, coin5View.frame.size.width - 40, 20);
    [coin5Btn setTitle:@"US$43.99" forState:UIControlStateNormal];
    coin5Btn.value = 5200;
    [coin5Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin5Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin5Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin5Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin5BtnView addSubview:coin5Btn];

    
    
    // - coin6 View
    UIView *coin6View = [[UIView alloc] initWithFrame:CGRectMake(coinsView.frame.size.width/3*2, coinsNameView.frame.size.height + coin1View.frame.size.height, coinsView.frame.size.width/3, 150)];
    [coinsView addSubview:coin6View];
    
    UIImageView *coin6ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coin6View.frame.size.width, 100)];
    [coin6ImgView setImage:[UIImage imageNamed:@"Images/pokecoin14500.png"]];
    [coin6ImgView setContentMode:UIViewContentModeScaleAspectFit];
    [coin6View addSubview:coin6ImgView];
    
    UILabel *coin6Label = [[UILabel alloc] initWithFrame:CGRectMake(0, coin6ImgView.frame.size.height, coin6View.frame.size.width, 25)];
    coin6Label.text = @"14,500 POKÉCOINS";
    [coin6Label setFont:[UIFont systemFontOfSize:10]];
    [coin6Label setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:0.8]];
    [coin6Label setTextAlignment:NSTextAlignmentCenter];
    [coin6View addSubview:coin6Label];
    
    // - - coin6BtnView
    UIView *coin6BtnView = [[UIView alloc] initWithFrame:CGRectMake(20, coin6ImgView.frame.size.height + coin6Label.frame.size.height + 4, coin6View.frame.size.width - 40, 20)];
    coin6BtnView.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:1];
    [coin6BtnView.layer setCornerRadius:3];
    [coin6View addSubview:coin6BtnView];
    
    ItemBtn *coin6Btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
    coin6Btn.frame = CGRectMake(0, 0, coin6View.frame.size.width - 40, 20);
    [coin6Btn setTitle:@"US$109.99" forState:UIControlStateNormal];
    coin6Btn.value = 14500;
    [coin6Btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [coin6Btn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [coin6Btn setTitleColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1] forState:UIControlStateNormal];
    [coin6Btn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [coin6BtnView addSubview:coin6Btn];

    
    
    
    
    
    // 스크롤뷰 Frame 조정
    [shopScrView setContentSize:CGSizeMake(shopScrView.frame.size.width, topView.frame.size.height + itemsView.frame.size.height + coinsView.frame.size.height)]; // 스크롤뷰 컨텐츠 사이즈 조정
    shopScrView.delegate = self;

    // Side View
    UIView *sideView1 = [[UIView alloc] initWithFrame:CGRectMake(0, -400, 5, topView.frame.size.height + itemsView.frame.size.height + coinsView.frame.size.height+800)];
    sideView1.backgroundColor = [UIColor colorWithRed:151/255.0 green:232/255.0 blue:142/255.0 alpha:1];
    [shopScrView addSubview:sideView1];
    UIView *sideView2 = [[UIView alloc] initWithFrame:CGRectMake(shopScrView.frame.size.width-5, -400, 5, topView.frame.size.height + itemsView.frame.size.height + coinsView.frame.size.height+800)];
    sideView2.backgroundColor = [UIColor colorWithRed:151/255.0 green:232/255.0 blue:142/255.0 alpha:1];
    [shopScrView addSubview:sideView2];
    
    
    NSLog(@"%lf", topView.frame.size.height + itemsView.frame.size.height + coinsView.frame.size.height);
    NSLog(@"%lf", shopScrView.frame.size.height);
    NSLog(@"%lf", self.view.frame.size.height);
    
    // State Label
    self.stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 150, 30)];
    self.stateLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 200);
    self.stateLabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:0.8];
    self.stateLabel.text = @"";
    [self.stateLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.stateLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1]];
    [self.stateLabel setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:self.stateLabel];
}
////////

////////


- (void)didSelectedBtn:(ItemBtn *)sender {
    NSLog(@"버튼을 클릭했습니다.");
    [self.view addSubview:self.stateLabel];
    
    
    if (self.myCoin + sender.value < 0) {
        NSLog(@"잔액이 부족합니다.");
        self.stateLabel.text = @"잔액이 부족합니다.";
        self.stateLabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:0.8];
        [self.stateLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1]];
    } else if (sender.value > 0) {
        self.realMoney += [sender.currentTitle floatValue];
        self.stateLabel.text = [NSString stringWithFormat:@"%지금까지 총 $%.2f 현질하였습니다.", self.realMoney];
        self.stateLabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:0.8];
        [self.stateLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1]];
        
        self.myCoin += sender.value;
        [self.myCoinLabel setText:[NSString stringWithFormat:@"%ld",self.myCoin]];
        
    } else {
        self.stateLabel.text = [NSString stringWithFormat:@"%ld Pokecoins 결제하였습니다.", -sender.value];
        self.stateLabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:241/255.0 blue:222/255.0 alpha:0.8];
        [self.stateLabel setTextColor:[UIColor colorWithRed:57/255.0 green:85/255.0 blue:82/255.0 alpha:1]];
        
        self.myCoin += sender.value;
        [self.myCoinLabel setText:[NSString stringWithFormat:@"%ld",self.myCoin]];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
