//
//  ASS_Login.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/11/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"

NSDictionary *userData;

@interface ASS_Login : UIViewController <UITextFieldDelegate>
{
    KeychainItemWrapper *keychain;
}

@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) IBOutlet UISwitch *rememberMe;
@property (strong, nonatomic) IBOutlet UILabel *rememberOption;
@property (nonatomic, readonly) IBOutlet UIButton *loginLBL;

- (IBAction)signIn:(id)sender;

- (IBAction)rememberMe:(UISwitch *)sender;

- (IBAction)exit:(id)sender;

@end
