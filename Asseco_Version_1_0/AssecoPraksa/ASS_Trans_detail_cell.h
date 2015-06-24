//
//  ASS_Trans_detail_cell.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/2/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_Trans_detail_cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameCredLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *amountCredLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *dateCredLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *numberCredLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *valutaCredLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *payment_descriptionLabelCell;

@end
