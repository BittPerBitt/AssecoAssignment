//
//  ASS_SettingsView.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_SettingsView : UIView

@property (strong, nonatomic) IBOutlet UIView *settingsView;
@property (strong, nonatomic) IBOutlet UIButton *backSettings;
@property (strong, nonatomic) IBOutlet UILabel *settAPPinfo;
@property (strong, nonatomic) IBOutlet UILabel *settAPPvers;

- (IBAction)back:(id)sender;

@end
