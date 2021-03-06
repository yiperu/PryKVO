//
//  AppDelegate.m
//  Borrar_HUB_Reachability0001
//
//  Created by Henry AT on 1/5/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


// Aqui implementaremos este metodo, para preaparar al objeto emisor, asi podra enviar notificaciones al NSNotificationCenter cuando ocurra un evento
// A este método no solamente se le llamará cuando pulsemos el botón home de nuestro dispositivo,
// sino también cuando se interrumpa temporalmente nuestra app como puede ser el caso de llamadas entrantes

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // El parámetro NSString es el que especifica el nombre del mensaje
    // a enviar, seguido del objeto que manda el aviso
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonHomeNotification" object:self];
    
}





- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
