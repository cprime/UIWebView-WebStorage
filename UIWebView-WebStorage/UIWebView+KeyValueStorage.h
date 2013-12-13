//
//  UIWebView+KeyValueStorage.h
//  BasicExample
//
//  Created by Colden Prime on 12/13/13.
//  Copyright (c) 2013 IntrepidPursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    KeyValueStorageTypeLocal,
    KeyValueStorageTypeSession,
} KeyValueStorageType;

@interface UIWebView (KeyValueStorage)

- (void)setString:(NSString *)string forKey:(NSString *)key type:(KeyValueStorageType)type;

- (NSString *)stringForKey:(NSString *)key type:(KeyValueStorageType)type;

- (void)removeStringForKey:(NSString *)key type:(KeyValueStorageType)type;

- (void)clearWithType:(KeyValueStorageType)type;

@end
