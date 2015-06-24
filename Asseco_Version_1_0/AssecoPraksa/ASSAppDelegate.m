//
//  ASSAppDelegate.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/11/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASSAppDelegate.h"

@implementation ASSAppDelegate

- (void)customizeAppearance
{
    //izgled UISwitcha
    [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:194.0f/255.0f green:215.0f/255.0f blue:223.0f/255.0f alpha:1.0]];
    [[UISwitch appearance] setTintColor:[UIColor colorWithRed:92.0f/255.0f green:160.0f/255.0f blue:187.0f/255.0f alpha:1.0]];
    [[UISwitch appearance] setThumbTintColor:[UIColor colorWithRed:55.0f/255.0f green:124.0f/255.0f blue:181.0f/255.0f alpha:1.0]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NSThread sleepForTimeInterval:2.0];
    
    [self customizeAppearance];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    return YES;
}

- (BOOL)tabBarController:(UITabBarController *)theTabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return (theTabBarController.selectedViewController != viewController);
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
