//
//  MyCell.m
//  TestPopOverCollectionView
//
//  Created by Quy Sang Le on 1/21/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "MyCell.h"
@interface MyCell()
@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UIButton *button;
@end

@implementation MyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor underPageBackgroundColor]];
        // Initialization code
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, 20)];
        [self.label setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.label];
        
        //
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        [self.button setBackgroundColor:[UIColor redColor]];
        [self.button setTitle:@"PopOver" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(popOVerClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
    }
    return self;
}
-(void) setTitle:(NSString *)title{
    _title = title;
    self.label.text = title;
}
-(void)popOVerClick:(UIButton *)button{
    [[self delegate] didPopOverClickInCell:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
