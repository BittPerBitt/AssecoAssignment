//
//  ASS_Info.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Info.h"

@implementation ASS_Info

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"kliknut 11111  ???");
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    NSLog(@"kliknut 2222???");
    // Configure the view for the selected state
}

@end
