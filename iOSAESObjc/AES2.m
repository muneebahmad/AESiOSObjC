//
//  AES2.m
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

#import "AES2.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (AES2)

//Call this to Enrypt with ECB Cipher Transformation mode. Iv is not required for ECB
- (NSData *) encryptECB:(NSString *)key {
    return [self aes128Operation:kCCEncrypt key:key iv:nil ecb:true];
}

//Call this to Decrypt with ECB Cipher Transformation mode. Iv is not required for ECB
- (NSData *) decryptECB:(NSString *)key {
    return [self aes128Operation:kCCDecrypt key:key iv:nil ecb:true];
}

//Call this to Encrypt with CBC Cipher Transformation mdoe.
- (NSData *) encryptCBC:(NSString *)key iv:(NSString *)iv {
    return [self aes128Operation:kCCEncrypt key:key iv:iv ecb:false];
}

//Call this to Decrypt with CBC Cipher Transformation mode.
- (NSData *) decryptCBC:(NSString *)key iv:(NSString *)iv {
    return [self aes128Operation:kCCDecrypt key:key iv:iv ecb:false];
}

//Used internally. Encrypts or Decrypts based on CCOperation
- (NSData *) aes128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv ecb:(BOOL) ecb {
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    if (iv) {
        [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    }
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus;
    if (ecb) {
        cryptStatus = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr,  kCCBlockSizeAES128, ivPtr, [self bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
    } else {
        cryptStatus = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr,  kCCBlockSizeAES128, ivPtr, [self bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
    }
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

@end
