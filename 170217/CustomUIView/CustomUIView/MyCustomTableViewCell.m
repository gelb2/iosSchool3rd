//
//  MyCustomTableViewCell.m
//  CustomUIView
//
//  Created by Jeheon Choi on 2017. 2. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "MyCustomTableViewCell.h"

@interface MyCustomTableViewCell ()

//자기소개 레이블
@property (nonatomic, weak) UIImageView *profileImgView;
@property (nonatomic, weak) UIView *profileTextContainer;
//네임 레이블
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UILabel *nameLB;
//디테일 레이블
@property (nonatomic, weak) UILabel *profileLB;


@end

@implementation MyCustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubviews];
        [self updateLayout];
//        [self test];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [self updateLayout];        // frame 재조정 적용
}

/////////////////////


- (void)creatSubviews {
    
    //******************PROFILE IMG VIEW******************//
    UIImageView *profileImgView = [[UIImageView alloc] init];
    profileImgView.clipsToBounds = YES;
    [self.contentView addSubview:profileImgView];
    self.profileImgView = profileImgView;
    
    //******************NAME UI******************//
    UIView *profileTextContainer = [[UIView alloc] init];
    [self.contentView addSubview:profileTextContainer];
    self.profileTextContainer = profileTextContainer;
    
    UILabel *titleLB = [[UILabel alloc] init];
    [self.profileTextContainer addSubview:titleLB];
    [titleLB setTextAlignment:NSTextAlignmentCenter];
    self.titleLB = titleLB;
    
    UILabel *nameLB = [[UILabel alloc] init];
    [nameLB setFont:[UIFont boldSystemFontOfSize:15]];
    [self.profileTextContainer addSubview:nameLB];
    [nameLB setTextAlignment:NSTextAlignmentCenter];
    self.nameLB = nameLB;

    
    //******************ProfileMSG UI******************//
    UILabel *profileLB = [[UILabel alloc] init];
    profileLB.numberOfLines = 4;
    [self.contentView addSubview:profileLB];
    self.profileLB = profileLB;
    
}

- (void)updateLayout
{
    const CGFloat MARGIN = 15;
    
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    //프로필 이미지 부분
    self.profileImgView.frame = CGRectMake(offsetX, offsetY, 100, 100);
    self.profileImgView.layer.cornerRadius = self.profileImgView.frame.size.width/2;
    
    //텍스트 네임 부분
    offsetX += self.profileImgView.frame.size.width;
    
    self.profileTextContainer.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, 100);
    
    self.titleLB.frame = CGRectMake(MARGIN, 0, self.profileTextContainer.frame.size.width - MARGIN * 2, self.profileTextContainer.frame.size.height/3);
    self.nameLB.frame = CGRectMake(MARGIN, self.titleLB.frame.size.height + MARGIN, self.profileTextContainer.frame.size.width - MARGIN * 2, self.profileTextContainer.frame.size.height/3);
    
    
    //텍스트 디테일 부분
    offsetX = MARGIN;
    offsetY += self.profileImgView.frame.size.height;
    
    self.profileLB.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - (MARGIN*2), self.frame.size.height - offsetY - MARGIN);
    
}

- (void)test
{
    self.backgroundColor = [UIColor blackColor];
    self.profileImgView.backgroundColor = [UIColor yellowColor];
    self.profileTextContainer.backgroundColor = [UIColor blueColor];
    self.profileLB.backgroundColor = [UIColor redColor];
}

- (void)setDataWithIMGName:(NSString *)imgUrlStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr
{
    self.profileImgView.image = [UIImage imageNamed:imgUrlStr];
    self.nameLB.text = nameStr;
    self.profileLB.text = msgStr;
}


@end
