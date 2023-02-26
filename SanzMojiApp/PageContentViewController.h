//
//  PageContentViewController.h
//  PhishMojiApp
//
//  Created by Selina on 12/6/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *btn_Rate;
@property (weak, nonatomic) IBOutlet UIButton *btn_ContactUS;
@property (weak, nonatomic) IBOutlet UIButton *btn_AllMojis;

- (IBAction)btn_Rate_Clicked:(id)sender;
- (IBAction)btn_Contact_Clicked:(id)sender;
- (IBAction)btn_ViewMoji_Clicked:(id)sender;

@end
