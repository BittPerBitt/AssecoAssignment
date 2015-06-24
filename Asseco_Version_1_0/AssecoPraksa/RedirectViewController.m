//
//  RedirectViewController.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "RedirectViewController.h"

@interface RedirectViewController ()

@end

@implementation RedirectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIStoryboard *settingsStoryboard = [UIStoryboard storyboardWithName:@"TecajnaListaSB" bundle:nil];
    UIViewController *rootSettingsView = [settingsStoryboard instantiateInitialViewController];
    [self.navigationController pushViewController:rootSettingsView animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
