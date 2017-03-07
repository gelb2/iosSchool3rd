//
//  Annotation.m
//  MapKit
//
//  Created by Jeheon Choi on 2017. 3. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "Annotation.h"

@interface Annotation ()

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end

@implementation Annotation

- (instancetype)initWithTitle:(NSString *)title AndCoordinate:(CLLocationCoordinate2D)coordinate {
    
    self = [super init];
    if (self) {
        self.title = title;
        self.coordinate = coordinate;
    }
    return self;
}

@end
