//
//  MyCell.h
//  TestPopOverCollectionView
//
//  Created by Quy Sang Le on 1/21/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCell;
@protocol MyCellDelegate
-(void)didPopOverClickInCell:(MyCell *)cell;
@end
@interface MyCell : UICollectionViewCell

@property (weak , nonatomic) id<MyCellDelegate> delegate;

@property (strong,nonatomic) NSString *title;
-(void) setTitle:(NSString *)title;
@end
