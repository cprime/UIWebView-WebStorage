//
//  UIWebView+KeyValueStorage.m
//  BasicExample
//
//  Created by Colden Prime on 12/13/13.
//  Copyright (c) 2013 IntrepidPursuits. All rights reserved.
//

#import "UIWebView+KeyValueStorage.h"

@implementation UIWebView (KeyValueStorage)

- (NSString *)storageWithType:(KeyValueStorageType)type {
    switch (type) {
        case KeyValueStorageTypeLocal:
            return @"localStorage";
        case KeyValueStorageTypeSession:
            return @"sessionStorage";
    }
}

- (void)setString:(NSString *)string forKey:(NSString *)key type:(KeyValueStorageType)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.setItem(\"%@\", \"%@\");", [self storageWithType:type], key, string]];
}

- (NSString *)stringForKey:(NSString *)key type:(KeyValueStorageType)type {
    return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.getItem(\"%@\");", [self storageWithType:type], key]];
}

- (void)removeStringForKey:(NSString *)key type:(KeyValueStorageType)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.removeItem(\"%@\");", [self storageWithType:type], key]];
}

- (void)clearWithType:(KeyValueStorageType)type {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.clear();", [self storageWithType:type]]];
}

@end
