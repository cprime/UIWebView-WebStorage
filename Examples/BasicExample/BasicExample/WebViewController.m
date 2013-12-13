//
//  WebViewController.m
//  BasicExample
//
//  Created by Colden Prime on 11/15/13.
//  Copyright (c) 2013 IntrepidPursuits. All rights reserved.
//

#import "WebViewController.h"
#import "SettingsViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *firstWebView;

@end

@implementation WebViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SettingsViewController *vc = (SettingsViewController *)segue.destinationViewController;
    vc.webview = self.firstWebView;
}

- (void)showSettingsViewController:(id)sender {
    [self performSegueWithIdentifier:@"ShowSettingsSeque" sender:sender];
}

- (void)reloadData:(id)sender {
    [self.firstWebView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *reloadItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                target:self
                                                                                action:@selector(reloadData:)];
    self.navigationItem.leftBarButtonItem = reloadItem;

    UIBarButtonItem *showSettingsItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(showSettingsViewController:)];
    self.navigationItem.rightBarButtonItem = showSettingsItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self reloadData:self];
}


@end
