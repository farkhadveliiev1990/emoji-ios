//
//  ListViewController.m
//  PhishMojiApp
//
//  Created by Selina on 12/6/16.
//  Copyright © 2016 Selina. All rights reserved.
//

#import "ListViewController.h"
#import "EmojiViewCell.h"
#import "ViewController.h"
#import "ShareViewController.h"
#import "Global.h"
#import "PageContentViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.EmojiCollectionView setDelegate:self];
    [self.EmojiCollectionView setDataSource:self];
    
    [self.EmojiCollectionView reloadData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 56;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EmojiViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EmojiViewCell" forIndexPath:indexPath];
    
    // Configure the cell
    
    cell.EmojiImg.layer.cornerRadius = 8.0;
    cell.EmojiImg.clipsToBounds = true;
    
    cell.EmojiImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", (int)indexPath.row+1]];
    
    return cell;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cell_width;
    
    cell_width = ([[UIScreen mainScreen] bounds].size.width-60)/4;
    
    CGSize cell_size = CGSizeMake(cell_width, cell_width);
    
    return cell_size;
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"selected %ld", (long)indexPath.row);
    
    shareFileName = [NSString stringWithFormat:@"%d.png", (int)indexPath.row+1];
    
    g_shareFileIndex = (int)indexPath.row+1;
    
    [self performSegueWithIdentifier:@"move_share" sender:self];
    
}


- (IBAction)btn_Back_Clicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
   
}



@end
