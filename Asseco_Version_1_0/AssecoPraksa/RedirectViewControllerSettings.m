//
//  RedirectViewControllerSettings.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "RedirectViewControllerSettings.h"
#import "ASS_Settings.h"

@interface RedirectViewControllerSettings ()

@end

@implementation RedirectViewControllerSettings

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    ASS_Settings *setingsVC = [[ASS_Settings alloc] init];
    
    [self.navigationController pushViewController:setingsVC animated:NO];
     
     }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
