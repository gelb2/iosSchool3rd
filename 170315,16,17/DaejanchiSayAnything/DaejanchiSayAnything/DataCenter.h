//
//  DataCenter.h
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "FLAnimatedImage.h"

@protocol logInDelegate;


@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic) NSString *token;

@property (nonatomic) CGFloat loginViewMovingHeight;
@property (weak, nonatomic) NSLayoutConstraint *loginViewCenterYConstraint;

@property (nonatomic) CGFloat signUpViewMovingHeight;
@property (weak, nonatomic) NSLayoutConstraint *signUpViewCenterYConstraint;

@end

