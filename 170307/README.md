####2017.03.07 - #36 (9주차 2번째 수업)

## 기기테스트  
- [[블로그] Developer Program 기기테스트 방법](http://lab.anybuild.co.kr/page/basic_app2)

## MapKit  
- TARGETS, Linked Frameworks and Libraries에서 Framework 추가
- CoreLocation Framework과 한 쌍
- 용어
  - Region : 지역(MKCoordinateRegion사용)
  - Span : 펼쳐진 영역(zoom level) - (MKCoordinateSpan사용)
  - Location Coordinate : 좌표
  - latitude : 위도 (wgs84 좌표계 사용)
  - longitude : 경도 (wgs84 좌표계 사용)
- GPS 보통 10m 정도 오차가 있다고 함 (테스트해보니 200m는 되는 것 같은데..?)  
- Pin은 mapView가 갖고 있음
- Annotation은 MKAnnotation Delegate protocol로 구현
- mapView의 Delegate protocol 메서드로 커스텀 핀 구현 가능
- 예제 코드  

	```objc
	// ViewController.m
	
	...
	
	- (void)viewDidLoad {
	    [super viewDidLoad];
		// 1. coordinate, span 정해서 지도 보여주기
		    
		CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(BASE_LATITUDE, BASE_LONGITUDE);
		MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
		    
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
	
	...
	
	// 3. 델리게이트 메소드를 통해, 내 위치 정보 중심으로 지도 보여주기
	- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
	
	    [manager stopUpdatingLocation];
	
	    CLLocationCoordinate2D coordinate = ((CLLocation *)locations.lastObject).coordinate;
	    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
	    
	    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
	    [self.mapView setRegion:region];
	
	    
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
	
	...
	
	```
	
	```objc
	// Annotation.h
	#import <Foundation/Foundation.h>
	#import <MapKit/MapKit.h>
	
	@interface Annotation : NSObject
	<MKAnnotation>
	
	@property (nonatomic, copy) NSString *title;
	
	@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
	
	- (instancetype)initWithTitle:(NSString *)title AndCoordinate:(CLLocationCoordinate2D)coordinate;
	
	@end
	
	```
	
	
	```objc
	// Annotation.m
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
	```
	
