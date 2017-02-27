//
//  StroyboardAddViewController.h
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 27..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StroyboardAddViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *testView;
@property (nonatomic, weak) IBOutlet UILabel *textLB;

@property (weak, nonatomic) IBOutlet UILabel *textLB2;

- (IBAction)btnAction:(UIButton *)sender;

@end
