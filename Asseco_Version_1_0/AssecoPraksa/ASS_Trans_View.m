//
//  ASS_Trans_View.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/2/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Trans_View.h"

@interface ASS_Trans_View ()

@end

@implementation ASS_Trans_View
@synthesize nameCredLabel, amountCredLabel, dateCredLabel, payment_descriptionLabel, numberCredLabel, valutaCredLabel, transDetail;

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
    [self setLabels];
}

-(void) getTransDetail:(id)transDetailObject
{
    transDetail = transDetailObject;
}

-(void) setLabels
{
    nameCredLabel.text = transDetail.creditorName;
    amountCredLabel.text = transDetail.amount;
    dateCredLabel.text = transDetail.value_date;
    payment_descriptionLabel.text = transDetail.payment_description;
    valutaCredLabel.text = transDetail.currency;
    numberCredLabel.text = transDetail.creditorAccNumber;
}

@end
