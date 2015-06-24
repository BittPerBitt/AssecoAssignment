//
//  ASS_Settings.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Settings.h"
#import "ASS_SettingsView.h"

@interface ASS_Settings () <UITabBarControllerDelegate>

@end

@implementation ASS_Settings
@synthesize infoLBL, languageLBL;

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
    self.navigationItem.hidesBackButton = YES;
    [self setUILocaliztionString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = NSLocalizedString(@"settingsTitle", nil);
    NSLog(@"apear 222");
}


-(void)viewDidLayoutSubviews:(BOOL)animated {
    // [settingsView removeFromSuperview];
    [self dismissViewControllerAnimated:NO completion:nil];
    NSLog(@"subviev 222");
}

-(void)viewWillLayoutSubviews:(BOOL)animated {
    // [settingsView removeFromSuperview];
    NSLog(@"subviev 31313");
}

- (IBAction)infoCustomNib:(id)sender
{
    ASS_SettingsView *settings = [[ASS_SettingsView alloc] init];
    settings.center = CGPointMake(160, 250);
    //ovo ako ugasimo ne mozemo pristupiti buton unutar nib fajla
    [self.view addSubview:settings];
}

- (IBAction)languageOption:(id)sender
{
    NSLog(@"buton 111");
    UIAlertView *error = [[UIAlertView alloc]
                          initWithTitle:NSLocalizedString(@"languageAlertButtonTitle", nil)
                          message:NSLocalizedString(@"languageAlertMessage", nil)
                          delegate:self
                          cancelButtonTitle:NSLocalizedString(@"languageAlertCancelButtonTitle", nil)
                          otherButtonTitles:nil];
    [error show];
}

-(void)setUILocaliztionString
{
    [self.infoLBL setTitle:NSLocalizedString(@"infoLBL", nil) forState:UIControlStateNormal];
    [self.languageLBL setTitle:NSLocalizedString(@"languageLBL", nil) forState:UIControlStateNormal];
}

@end
