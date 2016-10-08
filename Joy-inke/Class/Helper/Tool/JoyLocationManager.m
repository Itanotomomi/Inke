//
//  JoyLocationManager.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/22.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface JoyLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locManager;
@property (nonatomic, copy) LocationBlock block;

@end

@implementation JoyLocationManager

+ (instancetype)sharedManager {
    
    static JoyLocationManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[JoyLocationManager alloc] init];
    });
    
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locManager = [[CLLocationManager alloc] init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [_locManager setDistanceFilter:100];
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"开发定位服务");
        } else {
            CLAuthorizationStatus statue = [CLLocationManager authorizationStatus];
            if (statue == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(nonnull CLLocation *)newLocation
           fromLocation:(nonnull CLLocation *)oldLocation {
    
    CLLocationCoordinate2D coor = newLocation.coordinate;
    
    NSString *lat = [NSString stringWithFormat:@"%@", @(coor.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@", @(coor.longitude)];
    
    [JoyLocationManager sharedManager].lat = lat;
    [JoyLocationManager sharedManager].lon = lon;
    
    self.block(lat, lon);
    
    [self.locManager stopUpdatingLocation];
}

- (void)getGPS:(LocationBlock)block {
    
    self.block = block;
    [self.locManager startUpdatingLocation];
}

@end
