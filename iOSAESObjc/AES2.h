//
//  AES2.h
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

// Use this header to use all methods, the usage can be seen in ViewController.m

#import <Foundation/Foundation.h>

@interface NSData (AES2)
//Call this to Enrypt with ECB Cipher Transformation mode. Note a fact that iv is not required for ECB
- (NSData *) encryptECB:(NSString *)key;

//Call this to Decrypt with ECB Cipher Transformation mode. Note a fact that iv is not required for ECB
- (NSData *) decryptECB:(NSString *)key;

//Call this to Enrypt with CBC Cipher Transformation mode.
- (NSData *) encryptCBC:(NSString *)key iv:(NSString *)iv;

//Call this to Decrypt with CBC Cipher Transformation mode.
- (NSData *) decryptCBC:(NSString *)key iv:(NSString *)iv;

@end
