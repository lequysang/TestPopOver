//
//  MainViewController.h
//  TestPopOver
//
//  Created by Quy Sang Le on 1/21/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MyCell.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate,MyCellDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction)showInfo:(id)sender;

@end
