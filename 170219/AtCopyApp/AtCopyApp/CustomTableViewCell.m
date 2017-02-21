//
//  CustomTableViewCell.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "DDay.h"
#import "StatusCharacter.h"

@interface CustomTableViewCell ()

// Info Labels
@property  UILabel *termLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *percentLabel;

// Status Bar
@property (nonatomic) CGFloat percent;
@property (nonatomic, weak) UIView *backgroundBar;
@property (nonatomic, weak) UIView *statusBar;
// Status Character
@property (nonatomic, weak) StatusCharacter *character;
@property (nonatomic, weak) UIImageView *speechBalloon;
@property (nonatomic, weak) UILabel *speechBalloonLabel;

// Cell SeparatorLine
@property (nonatomic, weak) UIView *separatorLine;

@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.percent = 0;
        [self createSubviews];
        [self updateLayout];
//        [self test];
    }
    return self;
}

- (void)layoutSubviews {
    [self updateLayout];        // frame 재조정 적용
}


//////////////////////////////

- (void)createSubviews {
    
    // Info Labels
    UILabel *termLabel = [[UILabel alloc] init];
    [termLabel setFont:[UIFont systemFontOfSize:15]];
    [termLabel setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:termLabel];
    self.termLabel = termLabel;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [nameLabel setFont:[UIFont systemFontOfSize:20]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *percentLabel = [[UILabel alloc] init];
    [percentLabel setFont:[UIFont systemFontOfSize:20]];
    [percentLabel setTextColor:[UIColor whiteColor]];
    [percentLabel setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:percentLabel];
    self.percentLabel = percentLabel;

    // Status Bar
    UIView *backgroundBar = [[UIView alloc] init];
    [backgroundBar setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:backgroundBar];
    self.backgroundBar = backgroundBar;
    
    UIView *statusBar = [[UIView alloc] init];
    [statusBar setBackgroundColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
    [self.backgroundBar addSubview:statusBar];
    self.statusBar = statusBar;
    
    
    // Status Character
    StatusCharacter *character = [[StatusCharacter alloc] init];
    [self.backgroundBar addSubview:character];
    self.character = character;
    
    UIImageView *speechBalloon = [[UIImageView alloc] init];
    [speechBalloon setContentMode:UIViewContentModeScaleAspectFit];
    [self.character addSubview:speechBalloon];
    self.speechBalloon = speechBalloon;
    
    UILabel *speechBalloonLabel = [[UILabel alloc] init];
    [speechBalloonLabel setFont:[UIFont systemFontOfSize:15]];
    [speechBalloonLabel setTextColor:[UIColor blackColor]];
    [speechBalloonLabel setTextAlignment:NSTextAlignmentCenter];
    [self.speechBalloon addSubview:speechBalloonLabel];
    self.speechBalloonLabel = speechBalloonLabel;
    
    
    // Cell SeparatorLine
    UIView *separatorLine = [[UIView alloc] init];
    [separatorLine setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:separatorLine];
    self.separatorLine = separatorLine;

}

- (void)updateLayout {
    CGFloat const MARGIN = 20;
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;

    // Info Labels
    self.termLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width*3/4 - MARGIN, 20);

    offsetY += self.termLabel.frame.size.height;
    self.nameLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width*3/4 - MARGIN, 25);
    
    offsetX += self.termLabel.frame.size.width;
    offsetY = MARGIN * 3/2;
    self.percentLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width/4 - MARGIN, 25);
    
    
    // Status Bar
    offsetX = MARGIN;
    offsetY = self.frame.size.height * 4/5;
    self.backgroundBar.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - MARGIN*2, 12);

    self.statusBar.frame = CGRectMake(0, 0, self.backgroundBar.frame.size.width * self.percent / 100.0, self.backgroundBar.frame.size.height);
    
    // Status Character
    self.character.frame = CGRectMake(0, 0, self.frame.size.width/16, self.frame.size.height/3);
    [self.character setCharacterType:1];
    self.character.center = CGPointMake(self.statusBar.frame.size.width, -self.character.frame.size.height/4);
    
    if (self.percent <= 50) {
        [self.speechBalloon setImage:[UIImage imageNamed:@"speechBalloonL"]];
        self.speechBalloon.frame = CGRectMake(self.character.frame.size.width, 5, self.character.frame.size.width * 4, self.character.frame.size.height/2);
        self.speechBalloonLabel.frame = CGRectMake(self.speechBalloon.frame.size.width/10, -2, self.speechBalloon.frame.size.width*5/6, self.speechBalloon.frame.size.height);
    } else {
        [self.speechBalloon setImage:[UIImage imageNamed:@"speechBalloonR"]];
        self.speechBalloon.frame = CGRectMake(-self.character.frame.size.width * 4, 5, self.character.frame.size.width * 4, self.character.frame.size.height/2);
        self.speechBalloonLabel.frame = CGRectMake(3, -2, self.speechBalloon.frame.size.width*5/6, self.speechBalloon.frame.size.height);
    }
    
    
    // Cell SeparatorLine
    self.separatorLine.frame = CGRectMake(0, self.frame.size.height - 0.8, self.frame.size.width, 0.8);

}

- (void)test {
    [self setBackgroundColor:[UIColor grayColor]];
    [self.termLabel setBackgroundColor:[UIColor redColor]];
    [self.nameLabel setBackgroundColor:[UIColor yellowColor]];
    [self.percentLabel setBackgroundColor:[UIColor blueColor]];
    [self.speechBalloon setBackgroundColor:[UIColor cyanColor]];
    [self.speechBalloonLabel setBackgroundColor:[UIColor colorWithRed:24/255.0 green:153/255.0 blue:24/255.0 alpha:0.5]];
}

//////////////////////////////

- (void)setCellDataWithName:(NSString *)name
              withStartDate:(NSData *)startDate
                withEndDate:(NSData *)endDate {


    [self.nameLabel setText:name];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy. MM. dd. hh. mm. ss"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];

    NSInteger totalDay = 0;
    
    if ([endDate isEqual:@"0000. 00. 00"]) {
        [self.termLabel setText:[NSString stringWithFormat:@"%@", [startDate.description substringToIndex:12]]];
        
        totalDay = [DDay firstDay:[startDate.description substringToIndex:12] lastDay:[today.description substringToIndex:12]];
        [self.percentLabel setText:[NSString stringWithFormat:@"%ld%%", totalDay > 100 ? 99 : totalDay - 1]];

        self.percent = totalDay > 100 ? 99.0 : (CGFloat)totalDay - 1;
        
        [self.speechBalloonLabel setText:[NSString stringWithFormat:@"+%ld", totalDay]];
        
    } else {
        [self.termLabel setText:[NSString stringWithFormat:@"%@ - %@", [startDate.description substringToIndex:12], [endDate.description substringToIndex:12]]];
    
        totalDay = [DDay firstDay:[startDate.description substringToIndex:12] lastDay:[endDate.description substringToIndex:12]];
        NSInteger restDay = [DDay firstDay:[startDate.description substringToIndex:12] lastDay:[today.description substringToIndex:12]];
        
        [self.percentLabel setText:[NSString stringWithFormat:@"%ld%%", restDay*100/totalDay]];
        self.percent = restDay * 100 / (CGFloat)totalDay;
        
        [self.speechBalloonLabel setText:[NSString stringWithFormat:@"-%ld", totalDay-restDay]];
    }
}

@end
