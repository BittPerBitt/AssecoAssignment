//
//  ASS_Profil.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/13/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Profil.h"
#import "ASS_Login.h"

@interface ASS_Profil ()

@end

@implementation ASS_Profil
@synthesize jsonProfilName, jsonProfilAccNumber, jsonProfilAccCurrencyAmount, jsonProfilAccCurrencyCode, imageProfil, jsonArray, jsonIndicator, profilTitle;

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
    [self setUILocaliztionString];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.title = NSLocalizedString(@"profilTitle", nil);

    [jsonIndicator startAnimating];
    jsonIndicator.hidesWhenStopped = YES;

    NSURL *urlAddress = [NSURL URLWithString:@"http://188.226.211.157/api/v1/api.php"];
    NSStringEncoding *encoding = NULL;
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        NSString *jsonreturn = [[NSString alloc] initWithContentsOfURL:urlAddress usedEncoding:encoding error:NULL];
        //When json is loaded stop the indicator
        [jsonIndicator performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        NSLog(@"INDICATOR %@", jsonreturn);

    });

	// Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"\nProfil ViewControler ulogirani korisnik je: \n%@ \n", [defaults stringForKey:@"korisnikJSONkey"]);
    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=signIn&email=%@&password=%@",
                        [[NSUserDefaults standardUserDefaults] stringForKey:@"username"],
                        [[NSUserDefaults standardUserDefaults] stringForKey:@"password"]];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"\n\n-------RESPONSE PROFIL ULOGIRANOG KORISNIKA-------");
    NSLog(@"%@", strResult);
    NSLog(@"\n-------ESPONSE END-------\n\n");
    [self retrieveJSONdata];
    //retrieveJSONdata metoda koja nam ispisuje sta tocno dohvati iz jsona
    
}

-(void)viewDidAppear:(BOOL)animated {
    //self.navigationController.navigationBar.topItem.title = @"Profil";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)profilExitBTN:(id)sender {
    exit(0);
}

-(void) retrieveJSONdata
{
    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=signIn&email=%@&password=%@",
                        [[NSUserDefaults standardUserDefaults] stringForKey:@"username"],
                        [[NSUserDefaults standardUserDefaults] stringForKey:@"password"]];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    jsonArray = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:nil];
    
    NSLog(@"\n%@", jsonArray);
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:dataURL
                          options:kNilOptions
                          error:&error];
    
    NSArray* token = [json objectForKey:@"token"];
    NSArray* currency = [[[json objectForKey:@"account"] objectForKey:@"currency"] objectForKey:@"amount"];
    NSArray* code = [[[json objectForKey:@"account"] objectForKey:@"currency"] objectForKey:@"code"];
    NSLog(@"\nToken za korisnika %@: %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"username"], token);
    NSLog(@"%@", currency);
    NSLog(@"%@", code);
    //testovi da li sam putanju za nestet json objekte dobro upisao
    NSString *jsonProfilToken;

    jsonProfilName.text = [json objectForKey:@"name"];
    jsonProfilToken = [json objectForKey:@"token"];
    jsonProfilAccNumber.text = [[json objectForKey:@"account"] objectForKey:@"accountnumber"];
    [jsonProfilAccCurrencyAmount setText:[NSString stringWithFormat:@"%@", currency]];
    jsonProfilAccCurrencyCode.text = [[[json objectForKey:@"account"] objectForKey:@"currency"] objectForKey:@"code"];
    
    NSString* imageJSON = [json objectForKey:@"image"];
    NSLog(@"url image %@", imageJSON);
    NSLog(@"token- %@", jsonProfilToken);

    imageProfil.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageJSON]]];
    
    NSString *keyToken;
    keyToken= jsonProfilToken;
    //[jsonProfilToken setText:[NSString stringWithFormat:@"%@", token]];
    NSLog(@"token string- %@", keyToken);
    
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    [keychainWrapper setObject:keyToken forKey:(__bridge id)(kSecValueData)];
    NSLog(@"\n___SPREMLJENO!___\nTOKEN: %@", [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
    //spremanje u keyChain
    
}
//retrieveJSONdata metoda koja dohvaca ulogirane podatke i spaja ih s odgovarajucim linkom za spajanje na server, te dohvaca json odgovor i pretvara ga u čitajuci oblik za objective c, objekte koje mozemo koristiti kako nama odgovara, u ovom slucaju smo prikazali neke od podataka u Label na VC-profil korisnika

-(void)setUILocaliztionString
{
    self.UserNameLBL.text = NSLocalizedString(@"UserNameLBL", nil);
    self.UserAccNumberLBL.text = NSLocalizedString(@"UserAccNumberLBL", nil);
    self.UserAccAmountLBL.text = NSLocalizedString(@"UserAccAmountLBL", nil);
}

@end

//19_5_2015_10:46_verzija_gotov_profil_DOHVACANJE SLIKE JOS TREBA_dohvacanje slike napravljeno_idemo na mape!!! 10 navecer

//20_5_2015_
