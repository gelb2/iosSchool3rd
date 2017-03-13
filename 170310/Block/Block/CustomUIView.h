//
//  CustomUIView.h
//  Block
//
//  Created by Jeheon Choi on 2017. 3. 10..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString* (^BtnClickBlock)(void);

@interface CustomUIView : UIView

- (instancetype)initWithFrame:(CGRect)frame WithBlock:(BtnClickBlock)btnClickBlock;

@end
