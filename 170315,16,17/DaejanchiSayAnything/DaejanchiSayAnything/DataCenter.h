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

@property (nonatomic) CGFloat logInViewMovingHeight;
@property (nonatomic) CGFloat signUpViewMovingHeight;



#pragma mark - Token setter, getter, remover

+ (void)setUserTokenWithStr:(NSString *)tokenStr;
+ (NSString *)getUserToken;
+ (void)removeUserToken;

@end

