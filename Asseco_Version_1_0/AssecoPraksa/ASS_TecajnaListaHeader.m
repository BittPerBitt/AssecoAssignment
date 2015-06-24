//
//  ASS_TecajnaListaHeader.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_TecajnaListaHeader.h"

@interface ASS_TecajnaListaHeader()
{
    UILabel *textTitle;
}

@end

@implementation ASS_TecajnaListaHeader


-(id) initWithText:(NSString *) text
{
    CGRect headerViewRect = CGRectMake(0, 0, 0, 0);
    UIView* headerView = [[UIView alloc] initWithFrame:headerViewRect];
    headerView.backgroundColor = [UIColor blueColor];

    textTitle =[[UILabel alloc] initWithFrame:CGRectMake(5, 0, 310, 30)];
    textTitle.textColor = [UIColor blackColor];
    textTitle.backgroundColor = [UIColor lightGrayColor];
    textTitle.font = [UIFont systemFontOfSize:13];
    textTitle.text = text;
    textTitle.numberOfLines = 2;
    
    [headerView addSubview:textTitle];
    
    return  headerView;
    
}

-(void) setText:(NSString *) text
{
    textTitle.text = text;
}

@end
