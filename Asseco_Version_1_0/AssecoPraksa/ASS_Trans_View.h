//
//  ASS_Trans_View.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/2/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASS_Transakcije_JSON.h"

@interface ASS_Trans_View : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameCredLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountCredLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateCredLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberCredLabel;
@property (weak, nonatomic) IBOutlet UILabel *valutaCredLabel;
@property (weak, nonatomic) IBOutlet UILabel *payment_descriptionLabel;

@property (strong, nonatomic) ASS_Transakcije_JSON* transDetail;

-(void) getTransDetail:(id)transDetailObject;

-(void) setLabels;

@end
