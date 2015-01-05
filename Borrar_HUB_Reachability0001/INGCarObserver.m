//
//  INGCarObserver.m
//  Borrar_HUB_Reachability0001
//
//  Created by Henry AT on 1/5/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "INGCarObserver.h"

@implementation INGCarObserver




- (id)initWithCar:(INGCar *)inCar
{
    if (self = [super init]) {
        self.car = inCar;
        
        // Nos añadimos como observadores de ambas propiedades y nos notificará con el antiguo y nuevo valor
        [self.car addObserver:self forKeyPath:@"model" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
        [self.car addObserver:self forKeyPath:@"color" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    }
    
    return self;
}

-(void)dealloc
{
    // Nos eliminamos como observadores de ambas propiedades
    [self.car removeObserver:self forKeyPath:@"model"];
    [self.car removeObserver:self forKeyPath:@"color"];
}

#pragma mark - Callback KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    NSLog(@"Valor %@ --> Antes: %@ - Después: %@", keyPath, oldValue, newValue);
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    // Podemos hacer que las notificaciones manuales sean solo para una determinada propiedad
    if ([key isEqualToString:@"someVar"]) {
        return NO;
    }
    
    return YES;
}





@end
