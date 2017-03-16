//
//  NetworkModule.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "NetworkModule.h"
#import "DataCenter.h"


static NSString *const API_BASE_URL     = @"https://fc-ios.lhy.kr/api";

static NSString *const SIGN_UP_URL      = @"/member/signup/";
static NSString *const LOG_IN_URL       = @"/member/login/";
static NSString *const LOG_OUT_URL      = @"/member/logout/";
static NSString *const USER_DETAIL_URL  = @"/member/profile/";

static NSString *const POST_URL         = @"/post/";


@interface NetworkModule ()

@property (nonatomic) NSURLSession *session;

@end



@implementation NetworkModule

// Sign Up
+ (void)signUpWithUsername:(NSString *)username withPassword1:(NSString *)password1 withPassword2:(NSString *)password2 {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, SIGN_UP_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password1=%@&password2=%@", username, password1, password2] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    //Post Task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request
                                                                 fromData:nil
                                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

                                                            NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                            
                                                            if (error.code == 0) {
                                                                
                                                                NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                                
                                                                NSLog(@"%@", [responseDic objectForKey:@"key"]);
                                                                
                                                                
                                                                [DataCenter sharedInstance].token = [responseDic objectForKey:@"key"];
                                                                

                                                            } else {
                                                                
                                                                NSLog(@"network error code %ld", error.code);
                                                            
                                                            }
                                                        }];
    
    [postDataTask resume];
}


// Log In
+ (void)logInWithUsername:(NSString *)username withPassword:(NSString *)password {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, LOG_IN_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password=%@", username, password] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    //Post Task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request
                                                                 fromData:nil
                                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                            
                                                            NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                            
                                                            
                                                            if (error.code == 0) {
                                                                
                                                                NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                                
                                                                NSLog(@"%@",[responseDic objectForKey:@"key"]);
                                                                
                                                                
                                                                [DataCenter sharedInstance].token = [responseDic objectForKey:@"key"];
//                                                                [[DataCenter sharedInstance].logInDelegate logInStart];
                                                                
                                                                
                                                            } else {
                                                                
                                                                NSLog(@"network error code %ld", error.code);
                                                                
                                                            }
                                                            
                                                        }];
    
    [postDataTask resume];
}




@end
