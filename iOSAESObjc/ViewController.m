//
//  ViewController.m
//  iOSAESObjc
//
//  Created by Muneeb Ahmad on 17/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.
//

#import "ViewController.h"
#import "AES2.h"
#import "Base64.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Callback for Encryption Button Clicked
- (IBAction)encryptClicked:(id)sender {
    NSString* key = _etKey.text;
    NSString* value = _etEncrypted.text;
    NSLog(@"%@ %@", @"Key: ", key);
    NSLog(@"%@ %@", @"VALUE: ", value);
    //NOTE iv for ECB should be NULL
    NSString* ivCBC = @"RandomInitVector";               //16 bytes
    NSData* cipherData = [[value dataUsingEncoding:NSUTF8StringEncoding] encryptCBC:key iv:ivCBC];
    NSString* encData = [cipherData base64Encoding];
    if (encData != nil) {
        _etEncrypted.text = encData;
            NSLog(@"%@ %@", @"ENCRYPTED CBC: ", encData);
    [self makeResultDialog:@"Encrypted CBC" msg:encData];
    }
}

//Callback for Decryption Button Clicked
- (IBAction)decryptClicked:(id)sender {
    NSString* key = _etKey.text;
    NSString* encrypted = _etEncrypted.text;
    NSLog(@"%@ %@", @"Key: ", key);
    NSLog(@"%@ %@", @"VALUE: ", encrypted);
    //NOTE iv for CBC should be NULL
    NSString* ivCBC = @"RandomInitVector";               //16 bytes
    NSData* cipherData = [encrypted base64DecodedData];
    NSString* decData = [[NSString alloc] initWithData:[cipherData decryptCBC:key iv:ivCBC] encoding:NSUTF8StringEncoding];
    if (decData != nil) {
        _etEncrypted.text = decData;
        NSLog(@"%@ %@", @"DECRYPTED CBC: ", decData);
        [self makeResultDialog:@"Decrypted CBC" msg:decData];
    }
}

- (void) makeResultDialog:(NSString *) title msg:(NSString *)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
