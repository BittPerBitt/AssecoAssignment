//
//  ASS_Settings.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_Settings : UIViewController <UITabBarControllerDelegate>

- (IBAction)infoCustomNib:(id)sender;
- (IBAction)languageOption:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *infoLBL;
@property (strong, nonatomic) IBOutlet UIButton *languageLBL;


@end
