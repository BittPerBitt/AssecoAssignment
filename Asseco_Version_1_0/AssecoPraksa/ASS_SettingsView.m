//
//  ASS_SettingsView.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/10/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_SettingsView.h"
#import "ASS_Settings.h"

@implementation ASS_SettingsView
@synthesize settingsView, backSettings, settAPPinfo, settAPPvers;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //load xib
        [[NSBundle mainBundle] loadNibNamed:@"ASS_settingsViewXIB" owner:self options:nil];
        
        //adjust frame position bounds
        NSLog(@"frame %@", NSStringFromCGRect(self.settingsView.bounds));
        
        self.bounds = self.settingsView.bounds;
        //add subview
        
        [self addSubview:self.settingsView];
        
        CGRect rect = CGRectMake(10, 10, 0, 0);
        //koliko sam skuzio ovaj dio nema ulogu s prikazivanjem xiba kad se klikne na dugme, ali ako ovog nema nema djelovanja na buton
        settingsView = [[UIView alloc] initWithFrame:rect];
       
        settAPPinfo.text = NSLocalizedString(@"settAPPinfo", nil);
        settAPPvers.text = NSLocalizedString(@"settAPPvers", nil);

    }
    return self;
}

- (IBAction)back:(id)sender {
    NSLog(@"proba proba 2242444");
    self.backSettings.userInteractionEnabled=FALSE;
    [self removeFromSuperview];
}
@end
