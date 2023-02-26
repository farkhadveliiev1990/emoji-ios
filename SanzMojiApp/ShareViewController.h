//
//  ShareViewController.h
//  PhishMojiApp
//
//  Created by Selina on 12/8/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *SharingEmoji;

@property (weak, nonatomic) IBOutlet UIButton *btn_message;
@property (weak, nonatomic) IBOutlet UIButton *btn_instagram;
@property (weak, nonatomic) IBOutlet UIButton *btn_twitter;
@property (weak, nonatomic) IBOutlet UIButton *btn_facebook;

- (IBAction)btn_Back_Clicked:(id)sender;
- (IBAction)btn_Share_Clicked:(id)sender;

@end
