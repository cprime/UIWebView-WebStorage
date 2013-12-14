UIWebView+WebStorage
====================

UIWebView Category that adds CocoaTouch level hooks to HTML5 web storage.

### How to use:

#### 1. Load any URL into a UIWebView.

#### 2. Access that web view's SessionStorage and LocalStorage to your heart's content.

### UIWebView Category Interface

#### SessionStorage from a loaded UIWebView

```objective-c
- (void)setLocalStorageString:(NSString *)string forKey:(NSString *)key;
- (NSString *)localStorageStringForKey:(NSString *)key;
- (void)removeLocalStorageStringForKey:(NSString *)key;
- (void)clearLocalStorage;
```

#### LocalStorage from a loaded UIWebView

```objective-c
- (void)setSessionStorageString:(NSString *)string forKey:(NSString *)key;
- (NSString *)sessionStorageStringForKey:(NSString *)key;
- (void)removeSessionStorageStringForKey:(NSString *)key;
- (void)clearSessionStorage;
```