//
//  Woman.h
//  Exam0120
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//#import "Bank.h" // m파일에서 제거하고 이렇게 넣어도 괜찮음

// @class Bank;     // Person.h에 있으므로 없어도 됨

@interface Woman : Person

- (void)updateBankbook:(Bank *)bank;

@end
