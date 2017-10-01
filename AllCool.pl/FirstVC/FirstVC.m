//
//  FirstVC.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FirstVC.h"
@import GoogleMaps;
@import GooglePlaces;

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    HIDE_NAV_BAR
    GET_HEADER_VIEW
    
    header.title.text = @"Map";
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:28.33
                                                            longitude:77.100
                                                                 zoom:7];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) camera:camera];
    mapView.myLocationEnabled = YES;
    [self.view addSubview:mapView];
    // mapView.delegate = self;
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(28.39993, 77.990);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView;
    marker.icon = [UIImage imageNamed:@"ll-3.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
