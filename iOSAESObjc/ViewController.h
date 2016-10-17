//
//  ViewController.h
//  iOSAESObjc
//
//  Created by Muneeb Ahmad on 17/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.
//

//
// The Base64 class is used from a snippet on Internet instead of adding it as a dependency.
// So this project can be built easily without dependency management or framework integration.
//

// TOOLS: XCode 6.3
// Exception handling is not done, you can deal with it yourself if you face any.

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *etEncrypted;
@property (weak, nonatomic) IBOutlet UITextField *etKey;

- (IBAction)encryptClicked:(id)sender;

- (IBAction)decryptClicked:(id)sender;


@end

