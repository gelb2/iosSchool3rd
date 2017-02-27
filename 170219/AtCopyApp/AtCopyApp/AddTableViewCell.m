//
//  AddTableViewCell.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AddTableViewCell.h"

@interface AddTableViewCell ()

@property (nonatomic) NSInteger cellType;

@end

@implementation AddTableViewCell

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
    }
    
    return self;
}

- (void)setCellType:(NSInteger)typeNum {
    self.cellType = typeNum;
}

- (void)layoutSubviews {
    [self updateLayout];        // frame 재조정 적용
}

//////////////////////////////

- (void)createSubviews {
    switch (self.cellType) {
        case TITLE: {
            UITextField *tF = [[UITextField alloc] initWithFrame:self.frame];
            tF.placeholder = @"제목을 입력해주세요";
            tF.text = @"제목제목";
            [tF setFont:[UIFont boldSystemFontOfSize:50]];
            [self addSubview:tF];
            break;
        }
        case DATE:
            
            break;
        case CHARACTER:
            
            break;
        default:
            break;
    }
    
}

- (void)updateLayout {
    
}

@end
