//
//  NetworkModule.m
//  DaejanchiSayAnything
//
//  Created by Jeheon Choi on 2017. 3. 16..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "NetworkModule.h"
#import "DataCenter.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>


static NSString *const API_BASE_URL     = @"https://fc-ios.lhy.kr/api";

static NSString *const SIGN_UP_URL      = @"/member/signup/";
static NSString *const LOG_IN_URL       = @"/member/login/";
static NSString *const LOG_OUT_URL      = @"/member/logout/";
static NSString *const USER_DETAIL_URL  = @"/member/profile/";

static NSString *const POST_URL         = @"/post/";



@interface NetworkModule ()

@end



@implementation NetworkModule

// Sign Up
+ (void)signUpRequestWithUsername:(NSString *)username
                    withPassword1:(NSString *)password1
                    withPassword2:(NSString *)password2
              withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, SIGN_UP_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password1=%@&password2=%@", username, password1, password2] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    // Task
    NSURLSessionUploadTask *postTask = [session uploadTaskWithRequest:request
                                                             fromData:nil
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        
                                                        NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                        //                                                        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                        
                                                        if (error == nil) {
                                                            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                            NSLog(@"%@",[responseDic objectForKey:@"key"]);
                                                            
                                                            [DataCenter setUserTokenWithStr:[responseDic objectForKey:@"key"]];
                                                            completionBlock([responseDic objectForKey:@"key"]!=nil, responseDic);
                                                            
                                                        } else {
                                                            NSLog(@"network error code %ld", error.code);
                                                            completionBlock(NO, nil);
                                                        }
                                                    }];
    
    [postTask resume];
}


// Log In
+ (void)logInRequestWithUsername:(NSString *)username
                    withPassword:(NSString *)password
             withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, LOG_IN_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password=%@", username, password] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    // Task
    NSURLSessionUploadTask *postTask = [session uploadTaskWithRequest:request
                                                             fromData:nil
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        
                                                        NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                        
                                                        if (error == nil) {
                                                            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                            NSLog(@"%@",[responseDic objectForKey:@"key"]);
                                                            
                                                            [DataCenter setUserTokenWithStr:[responseDic objectForKey:@"key"]];
                                                            completionBlock([responseDic objectForKey:@"key"]!=nil, responseDic);
                                                            
                                                        } else {
                                                            NSLog(@"network error code %ld", error.code);
                                                            completionBlock(NO, nil);
                                                        }
                                                    }];
    
    [postTask resume];
    
}



// Log Out
+ (void)logOutRequestWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, LOG_OUT_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 헤더 세팅
    [request addValue:[NSString stringWithFormat:@"token %@", [DataCenter getUserToken]] forHTTPHeaderField:@"Authorization"];
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];        // @"" 왜 넣어야하지?
    request.HTTPMethod = @"POST";
    
    // Task
    NSURLSessionUploadTask *postTask = [session uploadTaskWithRequest:request
                                                             fromData:nil
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        
                                                        NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                        
                                                        // NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                        
                                                        if (error == nil) {
                                                            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                            
                                                            NSLog(@"로그아웃, token : %@", [DataCenter getUserToken]);
                                                            [DataCenter removeUserToken];
                                                            NSLog(@"초기화 완료 -> token : %@", [DataCenter getUserToken]);
                                                            
                                                            completionBlock(YES, responseDic);
                                                            
                                                        } else {
                                                            NSLog(@"network error code %ld", error.code);
                                                            completionBlock(NO, nil);
                                                        }
                                                    }];
    
    [postTask resume];
    
}



// Post Create
- (void)postCreateRequestWithTitle:(NSString *)title
                       withContent:(NSString *)content
                           withImg:(NSData *)imageData
               withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, POST_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"Token %@", [DataCenter getUserToken]] forHTTPHeaderField:@"Authorization"];
    
    
    
    /*************************** Multipart Data *************************/
    
    // Start boundary
    NSString *boundary = @"----------------0x0x0x0x0x0x";
    NSMutableData *body = [NSMutableData data];
    
    // 타이틀 정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n%@", title] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 컨텐츠 정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"content\"\r\n\r\n%@", content] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 이미지 정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"img_cover\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:imageData];
    
    // End boundary
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    /************************ Multipart Data End ************************/
    
    
    // Body
    request.HTTPBody = body;
    NSString* multiPartContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:multiPartContentType forHTTPHeaderField: @"Content-Type"];
    
    
    // Task
    NSURLSessionUploadTask *postTask = [session uploadTaskWithRequest:request
                                                             fromData:nil
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        
                                                        NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                        
                                                        // NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                        
                                                        if (error == nil) {
                                                            
                                                            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                            NSLog(@"%@", responseDic);
                                                            
                                                            completionBlock(YES, responseDic);
                                                            
                                                        } else {
                                                            NSLog(@"network error code %ld", error.code);
                                                            completionBlock(NO, nil);
                                                        }
                                                    }];
    
    [postTask resume];
    
}



// Post List
+ (void)postListRequestWithPage:(NSInteger)page
            withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?page=%ld", API_BASE_URL, POST_URL, page]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    
    // Task
    NSURLSessionDataTask *getTask = [session dataTaskWithRequest:request
                                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                   
                                                   NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                   
                                                   if (error == nil) {
                                                       NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                       NSLog(@"GetPostList, %@", responseDic);
                                                       completionBlock(YES, responseDic);
                                                       
                                                   } else {
                                                       NSLog(@"network error code %ld", error.code);
                                                       completionBlock(NO, nil);
                                                   }
                                               }];
    
    [getTask resume];
    
}



// Post Retrieve
- (void)postRetrieveRequestWithPostPK:(NSInteger)postPK
                  withCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%ld/", API_BASE_URL, POST_URL, postPK]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    
    // Task
    NSURLSessionDataTask *getTask = [session dataTaskWithRequest:request
                                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                   
                                                   NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                   
                                                   if (error == nil) {
                                                       NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                       NSLog(@"GetPostPK %ld, %@", postPK, responseDic);
                                                       completionBlock(YES, responseDic);
                                                       
                                                   } else {
                                                       NSLog(@"network error code %ld", error.code);
                                                       completionBlock(NO, nil);
                                                   }
                                               }];
    
    [getTask resume];
    
}





@end
