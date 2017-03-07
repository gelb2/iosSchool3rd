//
//  ViewController.m
//  MapKit
//
//  Created by Jeheon Choi on 2017. 3. 7..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"

// King Sejong Station
static const CGFloat BASE_LATITUDE = -62.223278;
static const CGFloat BASE_LONGITUDE = -58.787960;



@interface ViewController ()
<CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic) Annotation *anno;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 1. coordinate, span 정해서 지도 보여주기
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(BASE_LATITUDE, BASE_LONGITUDE);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [self.mapView setRegion:region];
    
    
    // 2. 내 위치 정보 받아서 지도 위에 띄우기
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    // display user location
    [self.mapView setShowsUserLocation:YES];
    
    
    self.mapView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// 3. 델리게이트 메소드를 통해, 내 위치 정보 중심으로 지도 보여주기
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    CLLocationCoordinate2D coordinate = ((CLLocation *)locations.lastObject).coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [self.mapView setRegion:region];

//    [manager stopUpdatingLocation];
    
    // 4. Pin 추가 (Add Annotation)
    self.anno = [[Annotation alloc] initWithTitle:@"myPosition" AndCoordinate:coordinate];
    [self.mapView addAnnotation:self.anno];

}


// 5. Annotation Custom Pin 적용
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

    MKAnnotationView *newAnnotation = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    
    if(!newAnnotation) {
        Annotation *myAnnotation = (Annotation *)annotation;
        newAnnotation = [[MKAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:@"pin"];

        UIView *anView = [[UIView alloc] init];
        anView.backgroundColor = [UIColor blueColor];
        anView.frame = CGRectMake(0, 0, 30, 30);
        
        newAnnotation.frame = CGRectMake(0, 0, 30, 30);     // frame 안줘도 subView들 잘 나옴
        [newAnnotation addSubview:anView];

    }

    return newAnnotation;
}

@end
