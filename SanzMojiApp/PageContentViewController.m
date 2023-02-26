//
//  PageContentViewController.m
//  PhishMojiApp
//
//  Created by Selina on 12/6/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backgroundImg.image = [UIImage imageNamed:self.imageFile];
    if (_pageIndex == 0) {
        [self.btn_Rate setHidden:NO];
        [self.btn_ContactUS setHidden: NO];
        [self.btn_AllMojis setHidden:YES];
    }
    else if ( _pageIndex == 5){
        [self.btn_AllMojis setHidden:NO];
        [self.btn_Rate setHidden:YES];
        [self.btn_ContactUS setHidden:YES];
        
    }
    else {
        
        [self.btn_AllMojis setHidden:YES];
        [self.btn_Rate setHidden:YES];
        [self.btn_ContactUS setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_Rate_Clicked:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please rate Phishmoji App!"
                                                    message:@"If you like it we'd like to know."
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"Rate It Now", @"Remind Me Later", @"No, Thanks", nil];
    alert.delegate = self;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"neverRate"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/phishmoji-emoji-keyboard-for/id1187719792?ls=1&mt=8"]]];
        
    }
    
    else if (buttonIndex == 1) {
        
    }
    
    else if (buttonIndex == 2) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"neverRate"];
    }
    
}


- (IBAction)btn_Contact_Clicked:(id)sender {
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.phishmoji.com/contact.html"]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.phishmoji.com/contact.html"] options:@{} completionHandler:nil];
}

- (IBAction)btn_ViewMoji_Clicked:(id)sender {
    
}

@end
