//
//  AES2.h
//  iOSAESObjc
//
//  Created by Muneeb Ahmad on 17/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES2)

- (NSData *) encryptECB:(NSString *)key iv:(NSString *)iv;
- (NSData *) decryptECB:(NSString *)key iv:(NSString *)iv;
- (NSData *) encryptCBC:(NSString *)key iv:(NSString *)iv;
- (NSData *) decryptCBC:(NSString *)key iv:(NSString *)iv;

@end
