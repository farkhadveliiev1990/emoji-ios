//
//  ShareViewController.m
//  PhishMojiApp
//
//  Created by Selina on 12/8/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import "ShareViewController.h"
#import "Global.h"
#import <MessageUI/MFMessageComposeViewController.h>
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#import <Social/Social.h>
//#import <MGInstagram/MGInstagram.h>
//#import <Mixpanel/Mixpanel.h>


@interface ShareViewController ()

//@property (strong, nonatomic) MGInstagram *instagram;
@property (strong, nonatomic) UIDocumentInteractionController *docController;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.SharingEmoji.layer.cornerRadius = 10.0;
    self.SharingEmoji.clipsToBounds = true;
    self.SharingEmoji.image = [UIImage imageNamed:shareFileName];
    
    self.btn_message.layer.cornerRadius = 20.0;
    self.btn_message.clipsToBounds = true;
    
    self.btn_instagram.layer.cornerRadius = 20.0;
    self.btn_instagram.clipsToBounds = true;
    
    self.btn_twitter.layer.cornerRadius = 20.0;
    self.btn_twitter.clipsToBounds = true;
    
    self.btn_facebook.layer.cornerRadius = 20.0;
    self.btn_facebook.clipsToBounds = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btn_Back_Clicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_Share_Clicked:(id)sender {

//    Mixpanel *mixpanel = [Mixpanel sharedInstance];
//    [mixpanel track:shareFileName];
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
            [self share_Message];
            //            [self share_email];
            break;
        case 1:
            [self share_Instagram];
            //            [self share_Message];
            break;
        case 2:
            [self share_Twitter];
            break;
        case 3:
            [self share_Facebook];
            break;
            
        default:
            break;
    }
}

- (void) share_Message{
    NSLog(@"pressed Message!");
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSString *message = @"Get the Phishmoji App!\nhttp://www.phishmoji.com";
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    //    [messageController setRecipients ;
    [messageController setBody:message];
    [messageController setTitle:@"Get the Phishmoj App!"];
    
    // Add attachment
    [messageController addAttachmentData:UIImageJPEGRepresentation([UIImage imageNamed:shareFileName], 1.0) typeIdentifier:@"public.image" filename:shareFileName];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
    
    
}

- (void) share_Instagram{
    NSLog(@"pressed Instagram!");
    
    NSURL *instagramURL = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/instagram/id389801252?mt=8"]];
    
    
    if([[UIApplication sharedApplication] canOpenURL:instagramURL])
    {
        
        UIImage *image = [UIImage imageNamed:shareFileName];
        
        
        
        NSData *imageData = UIImagePNGRepresentation(image);
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"insta.igo"]];
        [fileManager createFileAtPath:fullPath contents:imageData attributes:nil];
        NSLog(@"image saved");
        
        CGRect rect = CGRectMake(0 ,0 , 0, 0);
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIGraphicsEndImageContext();
        NSString *fileNameToSave = [NSString stringWithFormat:@"Documents/insta.igo"];
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:fileNameToSave];
        
        NSString *newJpgPath = [NSString stringWithFormat:@"file://%@",jpgPath];
        
        NSURL *igImageHookFile = [[NSURL alloc]initFileURLWithPath:newJpgPath];
        
        self.docController.UTI = @"com.instagram.exclusivegram";
        self.docController = [self setupControllerWithURL:igImageHookFile usingDelegate:self];
        self.docController=[UIDocumentInteractionController interactionControllerWithURL:igImageHookFile];
        NSString *caption = @"Get the Phishmoji app!   http://www.Phishmoji.com";
        self.docController.annotation=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",caption],@"InstagramCaption", nil];
        [self.docController presentOpenInMenuFromRect:rect inView: self.view animated:YES];
    }
    else
    {
        NSLog (@"Instagram not found");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Instagram Not Installed!"
                                                        message:@"Instagram must be installed on the device in order to post images."
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        alert.delegate = self;
        [alert show];
        
    }
    
}

- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate {
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    return interactionController;
}

- (void) share_Twitter{
    NSLog(@"pressed Twitter!");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
    
    
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if (tweetSheet) {
        
        [tweetSheet setInitialText:@"Get the Phishmoji app! \nhttp://www.phishmoji.com"];
        [tweetSheet addURL:[NSURL URLWithString:@"http://www.phishmoji.com"]];
        [tweetSheet addImage:[UIImage imageNamed:shareFileName]];
        
        [tweetSheet setCompletionHandler:^(SLComposeViewControllerResult result){
            
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"Posted");
            }else if (result == SLComposeViewControllerResultCancelled){
                NSLog(@"Post Cancelled");
            }else{
                NSLog(@"Post failed");
            }
        }];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    
    NSLog(@"%@", shareFileName);
        
        }
    
}

- (void) share_Facebook{
    NSLog(@"pressed Facebook!");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
    
    
    SLComposeViewController *controller= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    
    [controller setInitialText:@"Get the Phishmoji app! \n"];
    [controller addURL:[NSURL URLWithString:@"http://www.phishmoji.com"]];
    [controller addImage:[UIImage imageNamed:shareFileName]];
    
    [controller setCompletionHandler:^(SLComposeViewControllerResult result)
     {
         if (result == SLComposeViewControllerResultCancelled)
         {
             NSLog(@"The user cancelled.");
         }
         else if (result == SLComposeViewControllerResultDone)
         {
             NSLog(@"The user posted to Facebook");
         }
     }];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    NSLog(@"%@", shareFileName);
        
        }
}


#pragma MFMessageComposeViewController Delegate

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
