//
//  ListViewController.h
//  PhishMojiApp
//
//  Created by Selina on 12/6/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>



@property (weak, nonatomic) IBOutlet UICollectionView *EmojiCollectionView;


- (IBAction)btn_Back_Clicked:(id)sender;

@end
