//
//  main.m
//  Day5
//
//  Created by Jeheon Choi on 2017. 1. 20..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *h1 = [[Person alloc] initWithName:@"최제헌" Age:26 IDNum:920921];
    Person *h2 = [[Person alloc] initWithName:@"오정규" Age:28];
    Person *h3 = [[Person alloc] initWithName:@"이재연"];
    
    NSLog(@"%@ %ld %ld", h1.name, h1.age, h1.idNumber);
    NSLog(@"%@ %ld %ld", h2.name, h2.age, h2.idNumber);
    NSLog(@"%@ %ld %ld", h3.name, h3.age, h3.idNumber);
    

    return 0;
}
