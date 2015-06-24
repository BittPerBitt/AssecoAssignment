//
//  ASS_Transakcije_JSON.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/1/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Transakcije_JSON.h"

@implementation ASS_Transakcije_JSON
@synthesize transferID, creditorName, creditorCity, creditorAddress, creditorAccNumber, payment_description, debtorAccNumber, currency, amount, value_date, executed_date;

-(id) initWithTransferID: (NSString *) cID andCreditorName: (NSString *) cCreditorName andCreditorCity: (NSString *) cCreditorCity andCreditorAddress: (NSString *) cCreditorAddress andCreditorAccNumber: (NSString *) cCreditorAccNumber andPayment_description:(NSString *) cPayment_description andDebtorAccNumber:(NSString *) cDebtorAccNumber andCurrency: (NSString *) cCurrency andAmount: (NSString *) cAmount andValue_date: (NSString *) cValue_date andExecuted_date: (NSString *) cExecuted_date
{
    self = [super init];
    if (self)
    {
        transferID = cID;
        creditorName = cCreditorName;
        creditorCity = cCreditorCity;
        creditorAddress = cCreditorAddress;
        creditorAccNumber = cCreditorAccNumber;
        payment_description =cPayment_description;
        debtorAccNumber = cDebtorAccNumber;
        currency = cCurrency;
        amount = cAmount;
        value_date = cValue_date;
        executed_date = cExecuted_date;
    }
    return self;
}

@end
