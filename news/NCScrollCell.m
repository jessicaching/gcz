//
//  NCScrollCell.m
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NCScrollCell.h"
#import "UIScrollView+UITouch.h"

@implementation NCScrollCell

- (void)awakeFromNib {
    // Initialization code
    self.mScrollView.contentSize = CGSizeMake(kScreenWidth * 2, CGRectGetHeight(self.mScrollView.frame));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initData:(NSArray*)data
{
    self.mImageView.image = [UIImage imageNamed:[[data objectAtIndex:0] objectForKey:@"image"]];
    self.mLblTitle.text = [[data objectAtIndex:0] objectForKey:@"title"];
}
@end
