//
//  AppDelegate.m
//  TabBarController
//
//  Created by Jeheon Choi on 2017. 2. 21..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    
    ViewController *vc1 = [[ViewController alloc] init];
    ViewController *vc2 = [[ViewController alloc] init];
    ViewController *vc3 = [[ViewController alloc] init];
    ViewController *vc4 = [[ViewController alloc] init];
    ViewController *vc5 = [[ViewController alloc] init];
    
    tabbar.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"보관함" image:[self imageWithImage:@"Music" scaledToSize:CGSizeMake(30, 30)] tag:100];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"For You" image:[self imageWithImage:@"MusicStorage" scaledToSize:CGSizeMake(30, 30)] tag:200];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"둘러보기" image:[self imageWithImage:@"Heart" scaledToSize:CGSizeMake(30, 30)] tag:300];
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"라디오" image:[self imageWithImage:@"Radio" scaledToSize:CGSizeMake(30, 30)] tag:300];
    UITabBarItem *item5 = [[UITabBarItem alloc] initWithTitle:@"검색" image:[self imageWithImage:@"Search" scaledToSize:CGSizeMake(30, 30)] tag:300];
    
    vc1.tabBarItem = item1;
    vc2.tabBarItem = item2;
    vc3.tabBarItem = item3;
    vc4.tabBarItem = item4;
    vc5.tabBarItem = item5;
    
    [self.window setTintColor:[UIColor redColor]];


    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIImage *)imageWithImage:(NSString *)imageName scaledToSize:(CGSize)newSize {
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
