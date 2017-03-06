//
//  ViewController.m
//  DataTest
//
//  Created by Jeheon Choi on 2017. 3. 3..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];     // 싱글톤 객체
    NSDictionary *list = [NSDictionary dictionaryWithContentsOfFile:bundlePath];
    NSLog(@"list %@", list);
    
    

    // Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"paths %@", paths);
    
    // Documents directory base
    NSString *basePath = [paths objectAtIndex:0];
    NSLog(@"basepath %@", basePath);
    
    // file path
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"abc"];
    NSLog(@"%@", docuPath);

    // Document folder의 plist 파일 삭제
    
    
    // Document folder에 파일 있는지 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    NSLog(@"%@", dic);

    // 데이터 변경
    [dic setObject:@"01076771061" forKey:@"최제헌"];
    
    // 저장
    [dic writeToFile:bundlePath atomically:NO];
    
    
    NSLog(@"저장 : %@", [NSDictionary dictionaryWithContentsOfFile:bundlePath]);

    
    
    
    bundlePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];     // 싱글톤 객체
    list = [NSDictionary dictionaryWithContentsOfFile:bundlePath];
    NSLog(@"list %@", list);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
