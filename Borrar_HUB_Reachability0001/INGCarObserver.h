//
//  INGCarObserver.h
//  Borrar_HUB_Reachability0001
//
//  Created by Henry AT on 1/5/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "INGCar.h"

@interface INGCarObserver : NSObject


@property (nonatomic, strong) INGCar * car;

- (id)initWithCar:(INGCar *)inCar;



@end
