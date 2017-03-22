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
+ (void)signUpRequestWithUsername:(NSString *)username
                    withPassword1:(NSString *)password1
                    withPassword2:(NSString *)password2
              withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

// Log In
+ (void)logInRequestWithUsername:(NSString *)username
                    withPassword:(NSString *)password
             withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

// Log Out
+ (void)logOutRequestWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;





// Post Create
- (void)postCreateRequestWithTitle:(NSString *)title
                       withContent:(NSString *)content
                           withImg:(NSData *)imageData
               withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

// Post List
+ (void)postListRequestWithPage:(NSInteger)page
            withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;


// Post Retrieve
- (void)postRetrieveRequestWithPostPK:(NSInteger)postPK
                  withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;



@end
