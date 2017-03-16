//
//  NetworkModule.h
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkModule : NSObject

// Sign Up
+ (void)signUpWithUsername:(NSString *)username withPassword1:(NSString *)password1 withPassword2:(NSString *)password2;

// Log In
+ (void)logInWithUsername:(NSString *)username withPassword:(NSString *)password;

@end
