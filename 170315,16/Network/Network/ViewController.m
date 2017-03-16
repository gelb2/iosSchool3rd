//
//  ViewController.m
//  Network
//
//  Created by Jeheon Choi on 2017. 3. 15..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImage.h"

typedef NS_ENUM(NSInteger, StartStyle) {
    ImageDataWithContentsOfURLStyle = 0,
    ImageDataWithContentsOfURLStyleWithGCD,
    NSURLSessionStyle
};

const int CASE = NSURLSessionStyle;


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *startStyleLabel;
@property (nonatomic) NSArray *urlArr;

@property (weak, nonatomic) FLAnimatedImageView *imageView1;
@property (weak, nonatomic) FLAnimatedImageView *imageView2;
@property (weak, nonatomic) FLAnimatedImageView *imageView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.urlArr = @[@"https://media.giphy.com/media/JglVCaB0axZ4Y/giphy.gif",
                        @"https://media.giphy.com/media/OazoCyXHeGyDm/giphy.gif",
                        @"https://media.giphy.com/media/3o7TKC7R39vVnoaQBG/giphy.gif"
                        ];
    

    NSArray *startStyleArr = @[@"ImageDataWithContentsOfURLStyle",
                               @"ImageDataWithContentsOfURLStyleWithGCD",
                               @"NSURLSessionStyle"
                               ];
    
    [self.startStyleLabel setText:startStyleArr[CASE]];
    
    
    // FLAnimatedImageView 객체화, Frame 설정, addSubView
    [self setFLAnimatedImageViews];
    
    
    
    if (CASE == ImageDataWithContentsOfURLStyle) {
        
        NSLog(@"imageView1");
        _imageView1.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_urlArr[0]]]];

        NSLog(@"imageView2");
        _imageView2.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_urlArr[1]]]];
        
        NSLog(@"imageView3");
        _imageView3.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_urlArr[2]]]];
        
        
        
        
    } else if (CASE == ImageDataWithContentsOfURLStyleWithGCD) {
        
        for (NSInteger i = 0 ; i < _urlArr.count ; i++) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSLog(@"i = %ld, dispatch_get_global_queue : %d", i, [NSThread isMainThread]);
            
                FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_urlArr[i]]]];
            
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"i = %ld, dispatch_get_main_queue ? : %d", i, [NSThread isMainThread]);
                
                    switch (i) {
                        case 0:
                            _imageView1.animatedImage = image;
                            break;
                            
                        case 1:
                            _imageView2.animatedImage = image;
                            break;
                            
                        default:
                            _imageView3.animatedImage = image;
                            break;
                    }
                });
            });
        }

        
    } else if (CASE == NSURLSessionStyle) {
        
        
        for (NSInteger i = 0 ; i < _urlArr.count ; i++) {
            
            NSURL *thumbnailURL = [NSURL URLWithString:[_urlArr objectAtIndex:i]];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            NSURLSessionTask *task = [session dataTaskWithURL:thumbnailURL
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
                                                NSLog(@"i = %ld, isMainThread ? : %d", i, [NSThread isMainThread]);
                                                
                                                if (data) {
                                                    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
                                                    
                                                    if (image) {
                                                        //UI변경 코드
                                                        //변경을 위해 GCD사용
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            NSLog(@"i = %ld, dispatch_get_main_queue ? : %d", i, [NSThread isMainThread]);
                                                            
                                                            switch (i) {
                                                                case 0:
                                                                    _imageView1.animatedImage = image;
                                                                    break;
                                                                
                                                                case 1:
                                                                    _imageView2.animatedImage = image;
                                                                    break;
                                                            
                                                                default:
                                                                    _imageView3.animatedImage = image;
                                                                    break;
                                                            
                                                            }
                                                       
                                                        });
                                                    }
                                                }
                                            }];
            
            [task resume];
        
        }
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setFLAnimatedImageViews {
    
    FLAnimatedImageView *imageView1 = [[FLAnimatedImageView alloc] init];
    imageView1.frame = CGRectMake(self.view.frame.size.width*0.1, 60, self.view.frame.size.width*0.8, self.view.frame.size.width*0.4);
    [imageView1 setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView1];
    self.imageView1 = imageView1;
    
    
    FLAnimatedImageView *imageView2 = [[FLAnimatedImageView alloc] init];
    imageView2.frame = CGRectMake(self.view.frame.size.width*0.1, 90 + self.view.frame.size.width*0.4, self.view.frame.size.width*0.8, self.view.frame.size.width*0.4);
    [imageView2 setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView2];
    self.imageView2 = imageView2;
    
    
    FLAnimatedImageView *imageView3 = [[FLAnimatedImageView alloc] init];
    imageView3.frame = CGRectMake(self.view.frame.size.width*0.1, 120 + self.view.frame.size.width*0.8, self.view.frame.size.width*0.8, self.view.frame.size.width*0.4);
    [imageView3 setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView3];
    self.imageView3 = imageView3;
}


@end
