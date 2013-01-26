//
//  MainViewController.m
//  TestPopOver
//
//  Created by Quy Sang Le on 1/21/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"MYCELL"];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{
    if ([self.flipsidePopoverController isPopoverVisible]) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    } else {
        FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
        controller.label.text = @"Show Information";
        controller.delegate = self;
        
        self.flipsidePopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        
        [self.flipsidePopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

#pragma mark CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (MyCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYCELL" forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"Cell %i",indexPath.row];
    cell.delegate = self;
    return cell;
}


-(void)didPopOverClickInCell:(MyCell *)cell{
    if ([self.flipsidePopoverController isPopoverVisible]) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    } else {
                
        FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
        controller.label.text = cell.title;
        controller.delegate = self;
        
        self.flipsidePopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        [self.flipsidePopoverController presentPopoverFromRect:cell.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
