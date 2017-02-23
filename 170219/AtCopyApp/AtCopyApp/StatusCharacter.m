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

@property (nonatomic, weak) UIView *hair;
@property (nonatomic, weak) UIView *head;
@property (nonatomic, weak) UIView *body;
@property (nonatomic, weak) UIView *foot;

@end


@implementation StatusCharacter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createCharacterViews];
    }
    return self;
}


- (void)createCharacterViews {
    UIView *hair = [[UIView alloc] init];
    UIView *head = [[UIView alloc] init];
    UIView *body = [[UIView alloc] init];
    UIView *foot = [[UIView alloc] init];
    
    self.hair = hair;
    self.head = head;
    self.body = body;
    self.foot = foot;
    
    [self addSubview:hair];
    [self addSubview:head];
    [self addSubview:body];
    [self addSubview:foot];
}


- (void)setCharacterType:(NSInteger)num {
    self.num = num;
    [self setCharacter];
}




- (void)setCharacter {
    self.hair.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/8);
    self.head.frame = CGRectMake(0, self.frame.size.height*2/8, self.frame.size.width, self.frame.size.height*2/8);
    self.body.frame = CGRectMake(0, self.frame.size.height*4/8, self.frame.size.width, self.frame.size.height*3/8);
    self.foot.frame = CGRectMake(0, self.frame.size.height*7/8, self.frame.size.width, self.frame.size.height/8);
    
    switch (self.num) {
        case 1:
            [self.hair setBackgroundColor:[UIColor blackColor]];
            [self.head setBackgroundColor:[UIColor colorWithRed:235/255.0 green:187/255.0 blue:150/255.0 alpha:1]];
            [self.body setBackgroundColor:[UIColor colorWithRed:29/255.0 green:172/255.0 blue:235/255.0 alpha:1]];
            [self.foot setBackgroundColor:[UIColor blackColor]];
            break;
            
        default:
            break;
    }
}

@end
