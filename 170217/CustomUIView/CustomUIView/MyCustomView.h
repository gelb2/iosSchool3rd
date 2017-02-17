//
//  MyCustomView.h
//  CustomUIView
//
//  Created by Jeheon Choi on 2017. 2. 17..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomView : UIView

- (void)setDataWithIMGName:(NSString *)imgUrlStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr;

@end
