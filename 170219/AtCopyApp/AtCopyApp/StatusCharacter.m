//
//  StatusCharacter.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "StatusCharacter.h"

@interface StatusCharacter ()

@property NSInteger num;

@end


@implementation StatusCharacter


- (instancetype)initWithFrame:(CGRect)frame withNum:(NSInteger)num
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setCharacterType:(NSInteger)num {
    self.num = num;
    [self createCharacter];
}



- (void)createCharacter {
    
    UIView *hair = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/8)];
    [self addSubview:hair];
    
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*2/8, self.frame.size.width, self.frame.size.height*2/8)];
    [self addSubview:head];
    
    UIView *body = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*4/8, self.frame.size.width, self.frame.size.height*3/8)];
    [self addSubview:body];

    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*7/8, self.frame.size.width, self.frame.size.height/8)];
    [self addSubview:foot];
    
    switch (self.num) {
        case 1:
            [hair setBackgroundColor:[UIColor blackColor]];
            [head setBackgroundColor:[UIColor colorWithRed:235/255.0 green:187/255.0 blue:150/255.0 alpha:1]];
            [body setBackgroundColor:[UIColor colorWithRed:29/255.0 green:172/255.0 blue:235/255.0 alpha:1]];
            [foot setBackgroundColor:[UIColor blackColor]];
            break;
            
        default:
            break;
    }
}

@end
