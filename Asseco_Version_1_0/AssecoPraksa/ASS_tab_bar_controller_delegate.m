//
//  ASS_tab_bar_controller_delegate.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/9/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_tab_bar_controller_delegate.h"

@implementation ASS_tab_bar_controller_delegate

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSLog(@"tab bar kliknut");
    
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return viewController != tabBarController.selectedViewController;
    
}

@end


//kad se bilo koji tab bar klikne ispisuje se poruka, a ako se klikne na neki tab bar item vise puta da se sprijeci poremetanje lokacije viewa, nego da ostane na tom dab baru na kojem je