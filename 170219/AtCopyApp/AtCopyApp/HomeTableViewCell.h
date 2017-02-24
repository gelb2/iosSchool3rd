//
//  HomeTableViewCell.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

- (void)setCellDataWithName:(NSString *)name
              withStartDate:(NSData *)startDate
                withEndDate:(NSData *)endDate;

- (void)setInitialLayoutForAnimation;

- (void)statusBarAnimationStart;

@end
