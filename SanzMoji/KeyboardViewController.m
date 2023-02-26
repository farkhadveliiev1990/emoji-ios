//
//  KeyboardViewController.m
//  Phishmoji
//
//  Created by Marta on 12/6/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import "KeyboardViewController.h"
#import <GoogleMobileAds/GADBannerView.h>

@import Firebase;
@import GoogleMobileAds;

@interface KeyboardViewController () <GADBannerViewDelegate>{
    
    BOOL m_clickedShift;
    BOOL copied;
    
    int peopleMoji_count;
    int animalMoji_count;
    int stuffMoji_count;
    int wordMoji_count;
}
@property(nonatomic, strong) GADBannerView *bannerView;
//@property(nonatomic, weak, nullable) IBOutlet UIViewController *rootViewController;
//@property (weak, nonatomic) IBOutlet UIView *adsbannerView;
@property (nonatomic, strong) UIButton *nextKeyboardButton;

//Bottom View Buttons

@property (weak, nonatomic) IBOutlet UIButton *btn_Global;
@property (weak, nonatomic) IBOutlet UIButton *btn_People;
@property (weak, nonatomic) IBOutlet UIButton *btn_Animal;
@property (weak, nonatomic) IBOutlet UIButton *btn_Stuff;
@property (weak, nonatomic) IBOutlet UIButton *btn_Words;
@property (weak, nonatomic) IBOutlet UIButton *btn_Keyboard;

//Keys

@property (weak, nonatomic) IBOutlet UIButton *btn_123;
@property (weak, nonatomic) IBOutlet UIButton *btn_Space;
@property (weak, nonatomic) IBOutlet UIButton *btn_Return;
@property (weak, nonatomic) IBOutlet UIButton *btn_Shift;
@property (weak, nonatomic) IBOutlet UIButton *btn_Z;
@property (weak, nonatomic) IBOutlet UIButton *btn_X;
@property (weak, nonatomic) IBOutlet UIButton *btn_C;
@property (weak, nonatomic) IBOutlet UIButton *btn_M;
@property (weak, nonatomic) IBOutlet UIButton *btn_B;
@property (weak, nonatomic) IBOutlet UIButton *btn_V;
@property (weak, nonatomic) IBOutlet UIButton *btn_N;
@property (weak, nonatomic) IBOutlet UIButton *btn_Back;
@property (weak, nonatomic) IBOutlet UIButton *btn_A;
@property (weak, nonatomic) IBOutlet UIButton *btn_S;
@property (weak, nonatomic) IBOutlet UIButton *btn_D;
@property (weak, nonatomic) IBOutlet UIButton *btn_F;
@property (weak, nonatomic) IBOutlet UIButton *btn_G;
@property (weak, nonatomic) IBOutlet UIButton *btn_H;
@property (weak, nonatomic) IBOutlet UIButton *btn_J;
@property (weak, nonatomic) IBOutlet UIButton *btn_K;
@property (weak, nonatomic) IBOutlet UIButton *btn_L;
@property (weak, nonatomic) IBOutlet UIButton *btn_Q;
@property (weak, nonatomic) IBOutlet UIButton *btn_W;
@property (weak, nonatomic) IBOutlet UIButton *btn_E;
@property (weak, nonatomic) IBOutlet UIButton *btn_R;
@property (weak, nonatomic) IBOutlet UIButton *btn_T;
@property (weak, nonatomic) IBOutlet UIButton *btn_Y;
@property (weak, nonatomic) IBOutlet UIButton *btn_U;
@property (weak, nonatomic) IBOutlet UIButton *btn_I;
@property (weak, nonatomic) IBOutlet UIButton *btn_O;
@property (weak, nonatomic) IBOutlet UIButton *btn_P;

@property (weak, nonatomic) IBOutlet UIButton *btn_ABC;
@property (weak, nonatomic) IBOutlet UIButton *btn_NumSpace;
@property (weak, nonatomic) IBOutlet UIButton *btn_NumReturn;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_1;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_2;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_3;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_4;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_5;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_6;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_7;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_8;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_9;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_10;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_11;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_12;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_13;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_14;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_15;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_16;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_17;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_18;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_19;
@property (weak, nonatomic) IBOutlet UIButton *btn_Special_20;

@property (weak, nonatomic) IBOutlet UIButton *btn_1;
@property (weak, nonatomic) IBOutlet UIButton *btn_2;
@property (weak, nonatomic) IBOutlet UIButton *btn_3;
@property (weak, nonatomic) IBOutlet UIButton *btn_4;
@property (weak, nonatomic) IBOutlet UIButton *btn_5;
@property (weak, nonatomic) IBOutlet UIButton *btn_6;
@property (weak, nonatomic) IBOutlet UIButton *btn_7;
@property (weak, nonatomic) IBOutlet UIButton *btn_8;
@property (weak, nonatomic) IBOutlet UIButton *btn_9;
@property (weak, nonatomic) IBOutlet UIButton *btn_10;

//Views

@property (weak, nonatomic) IBOutlet UIView *Bottom_View;
@property (weak, nonatomic) IBOutlet UIView *Copied_View;
@property (weak, nonatomic) IBOutlet UIView *Keyboard_View;
@property (weak, nonatomic) IBOutlet UIView *Number_View;
@property (weak, nonatomic) IBOutlet UIView *People_View;
@property (weak, nonatomic) IBOutlet UIView *Animal_View;
@property (weak, nonatomic) IBOutlet UIView *Stuff_View;
@property (weak, nonatomic) IBOutlet UIView *Word_View;


- (IBAction)click_btn_Global:(id)sender;
- (IBAction)click_btn_People:(id)sender;
- (IBAction)click_btn_Animal:(id)sender;
- (IBAction)click_btn_Stuff:(id)sender;
- (IBAction)click_btn_Words:(id)sender;
- (IBAction)click_btn_Keyboard:(id)sender;


- (IBAction)click_btn_123:(id)sender;
- (IBAction)click_btn_ABC:(id)sender;
- (IBAction)click_btn_Space:(id)sender;
- (IBAction)click_btn_Return:(id)sender;
- (IBAction)click_btn_Shift:(id)sender;
- (IBAction)click_btn_Back:(id)sender;

- (IBAction)click_btn_Keys:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *Key_letters;

// ScrollViews

@property (weak, nonatomic) IBOutlet UIScrollView *people_scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *animal_scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *stuff_scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *word_scrollView;



@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

-(void) viewDidAppear:(BOOL)animated
{
    CGFloat _expandedHeight = 216;
    
    NSLayoutConstraint *_heightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant: _expandedHeight];
    [self.view addConstraint: _heightConstraint];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self.bannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, 0, width, GAD_SIZE_320x50.height-10)];
    self.bannerView.backgroundColor = [UIColor greenColor];
//    self.bannerView.delegate = self;
//    self.bannerView.adUnitID = @"ca-app-pub-4356277299702437~9424717316";
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/6300978111";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    [self addBannerViewToView:self.bannerView];
    
    [self.btn_Global.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.btn_People.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.btn_Animal.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.btn_Stuff.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.btn_Words.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.btn_Keyboard.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
//Keyboards
    
    [self.btn_123.layer setCornerRadius:5.0f];
    [self.btn_123.layer setMasksToBounds:YES];
    
    [self.btn_Space.layer setCornerRadius:5.0f];
    [self.btn_Space.layer setMasksToBounds:YES];
    
    [self.btn_Return.layer setCornerRadius:5.0f];
    [self.btn_Return.layer setMasksToBounds:YES];
    
    [self.btn_Shift.layer setCornerRadius:5.0f];
    [self.btn_Shift.layer setMasksToBounds:YES];
    
    [self.btn_Back.layer setCornerRadius:5.0f];
    [self.btn_Back.layer setMasksToBounds:YES];
    
    [self.btn_Z.layer setCornerRadius:5.0f];
    [self.btn_Z.layer setMasksToBounds:YES];
    
    [self.btn_X.layer setCornerRadius:5.0f];
    [self.btn_X.layer setMasksToBounds:YES];
    
    [self.btn_C.layer setCornerRadius:5.0f];
    [self.btn_C.layer setMasksToBounds:YES];
    
    [self.btn_V.layer setCornerRadius:5.0f];
    [self.btn_V.layer setMasksToBounds:YES];
    
    [self.btn_B.layer setCornerRadius:5.0f];
    [self.btn_B.layer setMasksToBounds:YES];
    
    [self.btn_N.layer setCornerRadius:5.0f];
    [self.btn_N.layer setMasksToBounds:YES];
    
    [self.btn_M.layer setCornerRadius:5.0f];
    [self.btn_M.layer setMasksToBounds:YES];
    
    [self.btn_A.layer setCornerRadius:5.0f];
    [self.btn_A.layer setMasksToBounds:YES];
    
    [self.btn_S.layer setCornerRadius:5.0f];
    [self.btn_S.layer setMasksToBounds:YES];
    
    [self.btn_D.layer setCornerRadius:5.0f];
    [self.btn_D.layer setMasksToBounds:YES];
    
    [self.btn_F.layer setCornerRadius:5.0f];
    [self.btn_F.layer setMasksToBounds:YES];
    
    [self.btn_G.layer setCornerRadius:5.0f];
    [self.btn_G.layer setMasksToBounds:YES];
    
    [self.btn_H.layer setCornerRadius:5.0f];
    [self.btn_H.layer setMasksToBounds:YES];
    
    [self.btn_J.layer setCornerRadius:5.0f];
    [self.btn_J.layer setMasksToBounds:YES];
    
    [self.btn_K.layer setCornerRadius:5.0f];
    [self.btn_K.layer setMasksToBounds:YES];
    
    [self.btn_L.layer setCornerRadius:5.0f];
    [self.btn_L.layer setMasksToBounds:YES];
    
    [self.btn_Q.layer setCornerRadius:5.0f];
    [self.btn_Q.layer setMasksToBounds:YES];
    
    [self.btn_W.layer setCornerRadius:5.0f];
    [self.btn_W.layer setMasksToBounds:YES];
    
    [self.btn_E.layer setCornerRadius:5.0f];
    [self.btn_E.layer setMasksToBounds:YES];
    
    [self.btn_R.layer setCornerRadius:5.0f];
    [self.btn_R.layer setMasksToBounds:YES];
    
    [self.btn_T.layer setCornerRadius:5.0f];
    [self.btn_T.layer setMasksToBounds:YES];
    
    [self.btn_Y.layer setCornerRadius:5.0f];
    [self.btn_Y.layer setMasksToBounds:YES];
    
    [self.btn_U.layer setCornerRadius:5.0f];
    [self.btn_U.layer setMasksToBounds:YES];
    
    [self.btn_I.layer setCornerRadius:5.0f];
    [self.btn_I.layer setMasksToBounds:YES];
    
    [self.btn_O.layer setCornerRadius:5.0f];
    [self.btn_O.layer setMasksToBounds:YES];
    
    [self.btn_P.layer setCornerRadius:5.0f];
    [self.btn_P.layer setMasksToBounds:YES];

//Numbers
    
    [self.btn_ABC.layer setCornerRadius:5.0f];
    [self.btn_ABC.layer setMasksToBounds:YES];
    
    [self.btn_NumSpace.layer setCornerRadius:5.0f];
    [self.btn_NumSpace.layer setMasksToBounds:YES];
    
    [self.btn_NumReturn.layer setCornerRadius:5.0f];
    [self.btn_NumReturn.layer setMasksToBounds:YES];
    
    [self.btn_Special_1.layer setCornerRadius:5.0f];
    [self.btn_Special_1.layer setMasksToBounds:YES];
    
    [self.btn_Special_2.layer setCornerRadius:5.0f];
    [self.btn_Special_2.layer setMasksToBounds:YES];
    
    [self.btn_Special_3.layer setCornerRadius:5.0f];
    [self.btn_Special_3.layer setMasksToBounds:YES];
    
    [self.btn_Special_4.layer setCornerRadius:5.0f];
    [self.btn_Special_4.layer setMasksToBounds:YES];
    
    [self.btn_Special_5.layer setCornerRadius:5.0f];
    [self.btn_Special_5.layer setMasksToBounds:YES];
    
    [self.btn_Special_6.layer setCornerRadius:5.0f];
    [self.btn_Special_6.layer setMasksToBounds:YES];
    
    [self.btn_Special_7.layer setCornerRadius:5.0f];
    [self.btn_Special_7.layer setMasksToBounds:YES];
    
    [self.btn_Special_8.layer setCornerRadius:5.0f];
    [self.btn_Special_8.layer setMasksToBounds:YES];
    
    [self.btn_Special_9.layer setCornerRadius:5.0f];
    [self.btn_Special_9.layer setMasksToBounds:YES];
    
    [self.btn_Special_10.layer setCornerRadius:5.0f];
    [self.btn_Special_10.layer setMasksToBounds:YES];
    
    [self.btn_Special_11.layer setCornerRadius:5.0f];
    [self.btn_Special_11.layer setMasksToBounds:YES];
    
    [self.btn_Special_12.layer setCornerRadius:5.0f];
    [self.btn_Special_12.layer setMasksToBounds:YES];
    
    [self.btn_Special_13.layer setCornerRadius:5.0f];
    [self.btn_Special_13.layer setMasksToBounds:YES];
    
    [self.btn_Special_14.layer setCornerRadius:5.0f];
    [self.btn_Special_14.layer setMasksToBounds:YES];
    
    [self.btn_Special_15.layer setCornerRadius:5.0f];
    [self.btn_Special_15.layer setMasksToBounds:YES];
    
    [self.btn_Special_16.layer setCornerRadius:5.0f];
    [self.btn_Special_16.layer setMasksToBounds:YES];
    
    [self.btn_Special_17.layer setCornerRadius:5.0f];
    [self.btn_Special_17.layer setMasksToBounds:YES];
    
    [self.btn_Special_18.layer setCornerRadius:5.0f];
    [self.btn_Special_18.layer setMasksToBounds:YES];
    
    [self.btn_Special_19.layer setCornerRadius:5.0f];
    [self.btn_Special_19.layer setMasksToBounds:YES];
    
    [self.btn_Special_20.layer setCornerRadius:5.0f];
    [self.btn_Special_20.layer setMasksToBounds:YES];
    
    [self.btn_1.layer setCornerRadius:5.0f];
    [self.btn_1.layer setMasksToBounds:YES];
    
    [self.btn_2.layer setCornerRadius:5.0f];
    [self.btn_2.layer setMasksToBounds:YES];
    
    [self.btn_3.layer setCornerRadius:5.0f];
    [self.btn_3.layer setMasksToBounds:YES];
    
    [self.btn_4.layer setCornerRadius:5.0f];
    [self.btn_4.layer setMasksToBounds:YES];
    
    [self.btn_5.layer setCornerRadius:5.0f];
    [self.btn_5.layer setMasksToBounds:YES];
    
    [self.btn_6.layer setCornerRadius:5.0f];
    [self.btn_6.layer setMasksToBounds:YES];
    
    [self.btn_7.layer setCornerRadius:5.0f];
    [self.btn_7.layer setMasksToBounds:YES];
    
    [self.btn_8.layer setCornerRadius:5.0f];
    [self.btn_8.layer setMasksToBounds:YES];
    
    [self.btn_9.layer setCornerRadius:5.0f];
    [self.btn_9.layer setMasksToBounds:YES];
    
    [self.btn_10.layer setCornerRadius:5.0f];
    [self.btn_10.layer setMasksToBounds:YES];
    
    
    m_clickedShift = NO;
    
    [self.Keyboard_View setHidden:NO];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
    
//    NSDictionary* keyboardInfo = [NSNotification userInfo];
//    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    
    if ([self validateKeyboardHasFullAccess]){
    
        // Jamaica_emoji = 8
        
        peopleMoji_count = 0;
        
        [self.people_scrollView setShowsVerticalScrollIndicator:YES];
        [self.people_scrollView setScrollEnabled:YES];
        [self.people_scrollView setShowsHorizontalScrollIndicator:NO];
        
        self.people_scrollView.contentSize = CGSizeMake(360, 180);
        
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 2; j++) {
                peopleMoji_count++;
                if (peopleMoji_count==9) {
                    break;
                }
                UIButton *btn_emo = [[UIButton alloc] initWithFrame:CGRectMake(30+i*80, 10+j*80, 80, 80)];
                
                [btn_emo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ja_%d.png", peopleMoji_count]] forState:UIControlStateNormal];
                
                [btn_emo addTarget:self action:@selector(onClickEmojiBTN:) forControlEvents:UIControlEventTouchUpInside];
//                [btn_emo.imageView setContentMode:UIViewContentModeScaleAspectFit];
                
                [self.people_scrollView addSubview:btn_emo];
                
                
            }
        }

        // AnimalMoji = 8
        
        animalMoji_count = 0;
        
        [self.animal_scrollView setShowsVerticalScrollIndicator:YES];
        [self.animal_scrollView setScrollEnabled:YES];
        [self.animal_scrollView setShowsHorizontalScrollIndicator:NO];
        
        self.animal_scrollView.contentSize = CGSizeMake(320,200);
        
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 2; j++) {
                animalMoji_count++;
                
                if (animalMoji_count == 9) {
                    break;
                }
                
                UIButton *btn_emoji = [[UIButton alloc] initWithFrame:CGRectMake(20+i*90, 20+j*90, 70, 70)];
                [btn_emoji setImage:[UIImage imageNamed:[NSString stringWithFormat:@"animal_%d.png", animalMoji_count]] forState:UIControlStateNormal];
                
                [btn_emoji addTarget:self action:@selector(onClickEmojiBTN:) forControlEvents:UIControlEventTouchUpInside];
                [btn_emoji.imageView setContentMode:UIViewContentModeScaleAspectFit];
                
                [self.animal_scrollView addSubview:btn_emoji];
            }
        }
        
        //StuffMoji = 20
        
        stuffMoji_count = 0;
        [self.stuff_scrollView setShowsVerticalScrollIndicator:YES];
        [self.stuff_scrollView setScrollEnabled:YES];
        [self.stuff_scrollView setShowsHorizontalScrollIndicator:NO];
        
        self.stuff_scrollView.contentSize = CGSizeMake(320, 470);
        
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5; j++) {
                stuffMoji_count++;
                if (stuffMoji_count==21) {
                    break;
                }
                UIButton *btn_emo = [[UIButton alloc] initWithFrame:CGRectMake(20+i*90, 20+j*90, 70, 70)];
                
                [btn_emo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"stuff_%d.png", stuffMoji_count]] forState:UIControlStateNormal];
                
                [btn_emo addTarget:self action:@selector(onClickEmojiBTN:) forControlEvents:UIControlEventTouchUpInside];
                [btn_emo.imageView setContentMode:UIViewContentModeScaleAspectFit];
                
                [self.stuff_scrollView addSubview:btn_emo];
                
                
            }
        }
        
        //WordMoji = 8
        
        wordMoji_count = 0;
        [self.word_scrollView setShowsVerticalScrollIndicator:YES];
        [self.word_scrollView setScrollEnabled:YES];
        [self.word_scrollView setShowsHorizontalScrollIndicator:NO];
        
        self.word_scrollView.contentSize = CGSizeMake(320, 200);
        
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 2; j++) {
                wordMoji_count++;
                if (wordMoji_count == 9) {
                    break;
                }
                UIButton *btn_emo = [[UIButton alloc] initWithFrame:CGRectMake(20+i*90, 20+j*90, 70, 70)];
                
                [btn_emo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"words_%d.png", wordMoji_count]] forState:UIControlStateNormal];
                
                [btn_emo addTarget:self action:@selector(onClickEmojiBTN:) forControlEvents:UIControlEventTouchUpInside];
                [btn_emo.imageView setContentMode:UIViewContentModeScaleAspectFit];
                
                [self.word_scrollView addSubview:btn_emo];
                
                
            }
        }
        
        
        
    }else {
        
        //        [self displayAllowMSG];
        
    }

    
    
}

- (void)addBannerViewToView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomLayoutGuide
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
}

- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    adView.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        adView.alpha = 1;
    }];
}

/// Tells the delegate an ad request failed.
- (void)adView:(GADBannerView *)adView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillPresentScreen");
}

/// Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillDismissScreen");
}

/// Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewDidDismissScreen");
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
    NSLog(@"adViewWillLeaveApplication");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

# pragma key press

- (void) hideCopyMessage{
    [self.Copied_View setHidden:YES];
}

- (void) onClickEmojiBTN:(id)sender
{
    UIButton* button = (UIButton*) sender;
    UIImage *img = button.imageView.image;
    
    UIPasteboard* pb = [UIPasteboard generalPasteboard];
    
    
    NSData* data = UIImagePNGRepresentation(img);
    [pb setData:data forPasteboardType:[UIPasteboardTypeListImage objectAtIndex:0]];
    
    [self.Copied_View setHidden:NO];
    [self performSelector:@selector(hideCopyMessage) withObject:nil afterDelay:1.5];
}

- (BOOL)validateKeyboardHasFullAccess {
    
    return !![UIPasteboard generalPasteboard];
}



- (IBAction)click_btn_Global:(id)sender{
    
    [self advanceToNextInputMode];
}
- (IBAction)click_btn_People:(id)sender{
    
    [self.Keyboard_View setHidden:YES];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:NO];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
    
}
- (IBAction)click_btn_Animal:(id)sender{
    
    [self.Keyboard_View setHidden:YES];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:NO];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
    
}
- (IBAction)click_btn_Stuff:(id)sender{
    
    [self.Keyboard_View setHidden:YES];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:NO];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
    
}
- (IBAction)click_btn_Words:(id)sender{
    
    [self.Keyboard_View setHidden:YES];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:NO];
    [self.Copied_View setHidden:YES];
    
}
- (IBAction)click_btn_Keyboard:(id)sender{
    
    [self.Keyboard_View setHidden:NO];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
    
}

- (IBAction)click_btn_123:(id)sender{
    
    [self.Keyboard_View setHidden:YES];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:NO];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
}
- (IBAction)click_btn_ABC:(id)sender{
    
    [self.Keyboard_View setHidden:NO];
    [self.Bottom_View setHidden:NO];
    [self.Number_View setHidden:YES];
    [self.People_View setHidden:YES];
    [self.Animal_View setHidden:YES];
    [self.Stuff_View setHidden:YES];
    [self.Word_View setHidden:YES];
    [self.Copied_View setHidden:YES];
}
- (IBAction)click_btn_Space:(id)sender{
    
    [self.textDocumentProxy insertText:@" "];
}
- (IBAction)click_btn_Return:(id)sender{
    
    [self.textDocumentProxy insertText:@"\n"];
}
- (IBAction)click_btn_Shift:(id)sender{
    
    m_clickedShift = !m_clickedShift;
    
    if (m_clickedShift == NO) {
        for (UIButton* letterButton in self.Key_letters) {
            [letterButton setTitle:letterButton.titleLabel.text.lowercaseString forState:UIControlStateNormal];
        }
        
    } else {
        for (UIButton* letterButton in self.Key_letters) {
            [letterButton setTitle:letterButton.titleLabel.text.uppercaseString forState:UIControlStateNormal];
        }
        
    }
}
- (IBAction)click_btn_Back:(id)sender{
    
    [self.textDocumentProxy deleteBackward];
}

- (IBAction)click_btn_Keys:(id)sender{
    
    UIButton *btn_key = (UIButton *)sender;
    
    [self.textDocumentProxy insertText:btn_key.titleLabel.text];
}
@end
