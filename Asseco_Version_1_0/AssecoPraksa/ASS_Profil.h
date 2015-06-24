//
//  ASS_Profil.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/13/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"

@interface ASS_Profil : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imageProfil;

@property (weak, nonatomic) IBOutlet UILabel *jsonProfilName;
@property (weak, nonatomic) IBOutlet UILabel *jsonProfilAccNumber;
@property (weak, nonatomic) IBOutlet UILabel *jsonProfilAccCurrencyAmount;
@property (weak, nonatomic) IBOutlet UILabel *jsonProfilAccCurrencyCode;

@property (strong, nonatomic) IBOutlet UILabel *UserNameLBL;
@property (strong, nonatomic) IBOutlet UILabel *UserAccNumberLBL;
@property (strong, nonatomic) IBOutlet UILabel *UserAccAmountLBL;

@property (strong, nonatomic) IBOutlet UINavigationItem *profilTitle;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *jsonIndicator;

@property (nonatomic, strong) NSArray *jsonArray;

- (IBAction)profilExitBTN:(id)sender;

-(void) retrieveJSONdata;

@end
