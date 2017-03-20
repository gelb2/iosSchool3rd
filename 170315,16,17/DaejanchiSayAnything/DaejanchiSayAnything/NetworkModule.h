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
+ (void)signUpWithUsername:(NSString *)username withPassword1:(NSString *)password1 withPassword2:(NSString *)password2 completionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

// Log In
+ (void)logInWithUsername:(NSString *)username withPassword:(NSString *)password completionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

// Log Out
+ (void)logOutWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

@end
