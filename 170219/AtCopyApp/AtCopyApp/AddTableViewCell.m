//
//  AddTableViewCell.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AddTableViewCell.h"

@implementation AddTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [self updateLayout];        // frame 재조정 적용
}

//////////////////////////////

- (void)createSubviews {

}

- (void)updateLayout {
    
}

@end
