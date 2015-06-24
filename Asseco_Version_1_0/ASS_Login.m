//
//  ASS_Login.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/11/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Login.h"

@interface ASS_Login ()

@end

@implementation ASS_Login
@synthesize userNameField, passField, rememberMe, rememberOption, loginLBL;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self setUILocaliztionString];

	// Do any additional setup after loading the view.
    
    self.userNameField.delegate = self;
    self.passField.delegate = self;
    
    userData = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"demo123", nil] forKeys:[NSArray arrayWithObjects:@"demo@banka.com", nil]]; //upisujemo predefinirane podatke koji omogucuju da unos podataka bude ispravan ukoliko njih upisemo + ako json odgovor valja
    NSLog(@"\nSpremljeni/registrirani korisnik je: %@ \n", [[NSUserDefaults standardUserDefaults] stringForKey:@"username"]);
    //ispisuje korisnika koji je spremljen na mobitelu
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userNameField.text = [defaults objectForKey:@"username"];
    passField.text = [defaults objectForKey:@"password"];
    //podatke koje upisujemo u user&pass field se spremaju u NSUD pod kljuceve username i pass
    
    if ([[defaults stringForKey:@"keyName"] isEqualToString:@"ON"])
    {
        rememberMe.on = YES;
    }
        else if([[defaults stringForKey:@"keyName"] isEqualToString:@"OFF"])
        {
            rememberMe.on = NO;
        }
    //if za switch, kako bi ostao uključen, tj zapamćen u zadnjem stanju u kojem ga korisnik ostavio
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userNameField resignFirstResponder];
    [self.passField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
//touchesBegan i textFieldShouldReturn služe za micanje tipkovnice kad se klikne na nazad/return ili bilo gdje na pozadini

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(id)sender
{

    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=signIn&email=%@&password=%@", userNameField.text, passField.text];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSError* error;
    
    if(!dataURL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"alertInternetTitle", nil) message:NSLocalizedString(@"alertInternetMessage", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"alertInternetButton", nil) otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:dataURL
                          options:kNilOptions
                          error:&error];
    
    //NSString* messageJSON = [json objectForKey:@"status"];
    //radi provjere json poruke koju nam vraca za message polje
    
    NSString *korisnikJSON = [json objectForKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:korisnikJSON forKey:@"korisnikJSONkey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
        //spremamo ime korisnika od json responsa koji smo dobili, kako bi ga kasnije mogli dohvatiti i prikazati ako nam treba
        NSLog(@"valja");


    if ([userNameField.text isEqualToString:@""] || [passField.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"loginAlertTitleEmptyField", nil)
                              message:NSLocalizedString(@"loginAlertMessageEF", nil)
                              delegate:self
                              cancelButtonTitle:NSLocalizedString(@"loginAlertCancelButtonEF", nil)
                              otherButtonTitles:nil];
        [error show];
        return;
    }
    
    if ([[json objectForKey:@"message"] isEqualToString:@"Success"]) {
        NSLog(@"\nKorisnik ispravan!");
        
        UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"loginAlertSuccesTitle", nil)
                              message:NSLocalizedString(@"loginAlertSuccesMessage", nil)
                              delegate:self cancelButtonTitle:NSLocalizedString(@"loginAlertSuccesButtonOK", nil)
                              otherButtonTitles:nil];
        
        [error show];
        [self performSegueWithIdentifier:@"login" sender:self];
    }
        else
        {
            UIAlertView *error = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"loginAlertFailTitle", nil)
                                  message:NSLocalizedString(@"loginAlertFailMessage", nil)
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"loginAlertFailButton", nil)
                                  otherButtonTitles:nil];
            [error show];
            NSLog(@"\nKrivi podatci/korisnik ne postoji!");
        }
        
    }

//nakon klika na signIN, provjerava se da li su sva polja popunjena ovisno o tome odgovarajuca poruka dolazi, nakon toga provjerava da li uneseni podatci za korisnika valjaju i da li vracaju response koji za message ima odgovor success, ako da pustamo ga u PROFIL viewControler s odgovorajucim podatcima za tog korisnika preko login segue-a

- (IBAction)rememberMe:(UISwitch *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([userNameField.text isEqualToString:@""] || [passField.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"loginAlertTitleEmptyField", nil)
                              message:NSLocalizedString(@"loginAlertMessageEF", nil)
                              delegate:self
                              cancelButtonTitle:NSLocalizedString(@"loginAlertCancelButtonEF", nil)
                              otherButtonTitles:nil];
        
        rememberMe.on = NO;
        [error show];
    }//if
    else
    {
        if (sender.tag == 0)
        {
            if (sender.on == 1)
            {
            [defaults setObject:@"ON" forKey:@"keyName"];
            KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UN_PASS" accessGroup:nil];
            [keychainWrapper setObject:userNameField.text forKey:(__bridge id)(kSecAttrAccount)];
            [keychainWrapper setObject:passField.text forKey:(__bridge id)(kSecValueData)];
            NSLog(@"\n___SPREMLJENO!___ \nusername_pass: %@,%@", [keychainWrapper objectForKey:(__bridge id)(kSecAttrAccount)],[keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
                //spremanje u keyChain
                
            [defaults setObject:userNameField.text forKey:@"username"];
            [defaults setObject:passField.text forKey:@"password"];
                //spremanje u NSUD

            [defaults setBool:YES forKey:@"registered"];
            [defaults synchronize];
            
            UIAlertView *error = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"userSavedTitle", nil)
                                  message:NSLocalizedString(@"userSavedMessage", nil)
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"userSavedButton", nil)
                                  otherButtonTitles:nil];
                
                NSLog(@"\nRegistrirani korisnik je: %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"username"]);
                
            [error show];
                
            }
            else if (sender.on == 0)
                {
                [defaults setObject:@"OFF" forKey:@"keyName"];
                userNameField.text = nil;
                passField.text = nil;
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
                NSLog(@"\nObrisani su podatci!");
                //-------
                KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UN_PASS" accessGroup:nil];
                [keychainWrapper resetKeychainItem];
                NSLog(@"\n___OBRISANO!___ \n\nusername_pass: %@,%@", [keychainWrapper objectForKey:(__bridge id)(kSecAttrAccount)],[keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
                }//else if
        }
    [defaults synchronize];
    }
}

- (IBAction)exit:(id)sender
{
    exit(0);
}

-(void)setUILocaliztionString
{
    [self.loginLBL setTitle:NSLocalizedString(@"loginLBL", nil) forState:UIControlStateNormal];
    self.rememberOption.text = NSLocalizedString(@"rememberOption", nil);
    self.userNameField.placeholder =NSLocalizedString(@"userPlaceholder", nil);
    self.passField.placeholder =NSLocalizedString(@"passPlaceholder", nil);

}

//remember me - akcija koja služi za spremljanje upisanih podataka u text fildove ako mi to želimo, kako na idućem loginu ne bismo morali ponovno upisivati podatke, isto tako prikazuje poruke ako su podatci spremljeni ili ako polja nisu ispunjena...
//ako je korisnik spremljen, svaki puta se podatci kor imena i lozinke prikazuju pri pokretanju aplikacije, ako se klikne switch, podatci se brisu te ih vise nece biti, isto tako ako se opet upisu podatci i klikne na zapamti me switch, podatci se spremaju kao prije...

@end
