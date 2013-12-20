//
//  UIWebView+KeyValueStorage.m
//  BasicExample
//
//  Created by Colden Prime on 12/13/13.
//  Copyright (c) 2013 IntrepidPursuits. All rights reserved.
//

#import "UIWebView+KeyValueStorage.h"

NSString * const kLocalStorageName = @"localStorage";
NSString * const kSessionStorageName = @"sessionStorage";

@implementation UIWebView (KeyValueStorage)

#pragma mark - Local Storage

- (void)setLocalStorageString:(NSString *)string forKey:(NSString *)key {
    [self ip_setString:string forKey:key type:kLocalStorageName];
}

- (NSString *)localStorageStringForKey:(NSString *)key {
    return [self ip_stringForKey:key type:kLocalStorageName];
}

- (void)removeLocalStorageStringForKey:(NSString *)key {
    [self ip_removeStringForKey:key type:kLocalStorageName];
}

- (void)clearLocalStorage {
    [self ip_clearWithType:kLocalStorageName];
}

#pragma mark - Session Storage

- (void)setSessionStorageString:(NSString *)string forKey:(NSString *)key {
    [self ip_setString:string forKey:key type:kSessionStorageName];
}

- (NSString *)sessionStorageStringForKey:(NSString *)key {
    return [self ip_stringForKey:key type:kSessionStorageName];
}

- (void)removeSessionStorageStringForKey:(NSString *)key {
    [self ip_removeStringForKey:key type:kSessionStorageName];
}

- (void)clearSessionStorage {
    [self ip_clearWithType:kSessionStorageName];
}

#pragma mark - Helpers

- (void)ip_setString:(NSString *)string forKey:(NSString *)key type:(NSString *)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.setItem('%@', '%@');", type, key, string]];
}

- (NSString *)ip_stringForKey:(NSString *)key type:(NSString *)type {
    return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.getItem('%@');", type, key]];
}

- (void)ip_removeStringForKey:(NSString *)key type:(NSString *)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.removeItem('%@');", type, key]];
}

- (void)ip_clearWithType:(NSString *)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.clear();", type]];
}

@end
