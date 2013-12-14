//
//  SettingsViewController.m
//  BasicExample
//
//  Created by Colden Prime on 11/15/13.
//  Copyright (c) 2013 IntrepidPursuits. All rights reserved.
//

#import "SettingsViewController.h"
#import "UIWebView+KeyValueStorage.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *localTextField;
@property (weak, nonatomic) IBOutlet UITextField *sessionTextField;

- (IBAction)submitButtonClicked:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = NO;

    self.localTextField.text = [self.webview localStorageStringForKey:@"message"];
    self.sessionTextField.text = [self.webview sessionStorageStringForKey:@"message"];
}

- (IBAction)clearLocalButtonClicked:(id)sender {
    [self.webview removeLocalStorageStringForKey:@"message"];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearSessionButtonClicked:(id)sender {
    [self.webview removeSessionStorageStringForKey:@"message"];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearAllButtonClicked:(id)sender {
    [self.webview clearLocalStorage];
    [self.webview clearSessionStorage];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonClicked:(id)sender {
    [self.webview setLocalStorageString:self.localTextField.text forKey:@"message"];
    [self.webview setSessionStorageString:self.sessionTextField.text forKey:@"message"];

    [self.navigationController popViewControllerAnimated:YES];
}

@end
