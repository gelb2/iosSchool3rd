//
//  Annotation.h
//  MapKit
//
//  Created by Jeheon Choi on 2017. 3. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject
<MKAnnotation>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (instancetype)initWithTitle:(NSString *)title AndCoordinate:(CLLocationCoordinate2D)coordinate;

@end
