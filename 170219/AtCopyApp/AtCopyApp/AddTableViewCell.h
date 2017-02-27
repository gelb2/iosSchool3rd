//
//  AddTableViewCell.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomTableViewCellType) {
    TITLE = 0,
    DATE,
    CHARACTER
};

@interface AddTableViewCell : UITableViewCell

- (void)setCellType:(NSInteger)typeNum;

@end
