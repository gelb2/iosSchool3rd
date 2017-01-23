//
//  Bank.m
//  ExamReview
//
//  Created by Jeheon Choi on 2017. 1. 23..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Bank.h"
#import "Person.h"

@implementation Bank

- (void)moveTo:(NSString *)location {
    NSLog(@"%@은행이 %@에서 %@로 주소를 변경하였습니다.", self.name, self.location, location);
    self.location = location;
}

- (void)transferTo:(Person *)toPerson from:(Person *)fromPerson amount:(NSUInteger)money {
    fromPerson.asset -= money;
    toPerson.asset += money;
    NSLog(@"%@가 %@에게 %lu를 이체하였습니다.", fromPerson.name, toPerson.name, money);
}

@end
