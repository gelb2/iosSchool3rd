//
//  CustomTableViewCell.m
//  AnimalUITableView
//
//  Created by Jeheon Choi on 2017. 2. 15..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.lb = [[UILabel alloc] initWithFrame:self.frame];
    [self.lb setFont:[UIFont boldSystemFontOfSize:13]];
    [self.lb setTextColor:[UIColor blueColor]];
    [self addSubview:self.lb];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
