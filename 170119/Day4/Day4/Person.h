//
//  Person.h
//  Day4
//
//  Created by Jeheon Choi on 2017. 1. 19..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

//@property (readonly) NSString *name;  // 읽을수만 읽게 설정할 수도 있음
@property NSString *name;
@property NSUInteger age;


- (void)eat;
- (void)talkTo:(Person *)person;

- (void)setIdNum:(NSUInteger)idNum;
- (void)getIdNum;
    
@end
