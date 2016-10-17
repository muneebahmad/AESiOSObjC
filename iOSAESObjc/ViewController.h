//
//  ViewController.h
//  iOSAESObjc
//
//  Created by Muneeb Ahmad on 17/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *etEncrypted;
@property (weak, nonatomic) IBOutlet UITextField *etKey;

- (IBAction)encryptClicked:(id)sender;

- (IBAction)decryptClicked:(id)sender;


@end

