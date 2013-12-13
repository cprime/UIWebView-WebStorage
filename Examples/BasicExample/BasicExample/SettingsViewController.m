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

    self.localTextField.text = [self.webview stringForKey:@"message" type:KeyValueStorageTypeLocal];
    self.sessionTextField.text = [self.webview stringForKey:@"message" type:KeyValueStorageTypeSession];
}

- (IBAction)clearLocalButtonClicked:(id)sender {
    [self.webview removeStringForKey:@"message" type:KeyValueStorageTypeLocal];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearSessionButtonClicked:(id)sender {
    [self.webview removeStringForKey:@"message" type:KeyValueStorageTypeSession];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearAllButtonClicked:(id)sender {
    [self.webview clearWithType:KeyValueStorageTypeLocal];
    [self.webview clearWithType:KeyValueStorageTypeSession];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonClicked:(id)sender {
    [self.webview setString:self.localTextField.text forKey:@"message" type:KeyValueStorageTypeLocal];
    [self.webview setString:self.sessionTextField.text forKey:@"message" type:KeyValueStorageTypeSession];

    [self.navigationController popViewControllerAnimated:YES];
}

@end
