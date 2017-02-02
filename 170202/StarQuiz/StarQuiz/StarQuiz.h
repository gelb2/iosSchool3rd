//
//  StarQuiz.h
//  StarQuiz
//
//  Created by Jeheon Choi on 2017. 2. 2..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarQuiz : NSObject

// mode 1~4
//
// 1 -> ***     2 -> *
//      **           **
//      *            ***
//
//
// 3 ->   *     4 ->  *
//       **          * *
//      ***         * * *
//

+ (void)starStar:(NSUInteger)starNum mode:(NSUInteger)modeNum;


@end
