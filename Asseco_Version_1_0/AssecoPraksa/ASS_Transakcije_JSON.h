//
//  ASS_Transakcije_JSON.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/1/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASS_Transakcije_JSON : NSObject

@property (nonatomic, strong) NSString *transferID;
@property (nonatomic, strong) NSString *creditorName;
@property (nonatomic, strong) NSString *creditorCity;
@property (nonatomic, strong) NSString *creditorAddress;
@property (nonatomic, strong) NSString *creditorAccNumber;
@property (nonatomic, strong) NSString *payment_description;
@property (nonatomic, strong) NSString *debtorAccNumber;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *value_date;
@property (nonatomic, strong) NSString *executed_date;

-(id) initWithTransferID: (NSString *) cID andCreditorName: (NSString *) cCreditorName andCreditorCity: (NSString *) cCreditorCity andCreditorAddress: (NSString *) cCreditorAddress andCreditorAccNumber: (NSString *) cCreditorAccNumber andPayment_description:(NSString *) cPayment_description andDebtorAccNumber:(NSString *) cDebtorAccNumber andCurrency: (NSString *) cCurrency andAmount: (NSString *) cAmount andValue_date: (NSString *) cValue_date andExecuted_date: (NSString *) cExecuted_date;

@end
