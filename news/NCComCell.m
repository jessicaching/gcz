//
//  NCComCell.m
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NCComCell.h"

@implementation NCComCell

- (void)awakeFromNib {
    // Initialization code
    self.mLblTag.layer.borderWidth = 0.5f;
    self.mLblTag.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.mLblTag.layer.cornerRadius = 2.f;
    self.mLblTag.clipsToBounds = YES;
    self.mLblTag.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initData:(NSDictionary*)data with:(NSInteger)index
{
    if ([[data objectForKey:@"type"] integerValue] == 2) {
        self.mImageView.image = [UIImage imageNamed:[data objectForKey:@"image"]];
        self.mLblTitle.text = [data objectForKey:@"title"];
        self.mLblIntro.text = [data objectForKey:@"content"];
        self.mLblComments.text = @"2345评";
    } else {
        self.mImageView.image = [UIImage imageNamed:[data objectForKey:@"image"]];
        self.mLblTitle.text = [data objectForKey:@"title"];
        self.mLblIntro.text = [data objectForKey:@"content"];
        self.mLblComments.text = @"849评";
        if (index == 0) {
            self.mLblComments.text = @"960评";
            self.mLblTag.text = @"独家";
            self.mLblTag.textColor = [UIColor blueColor];
        }
        if (index == 2) {
            self.mLblComments.text = @"5478评";
            self.mLblTag.text = @"推广";
            self.mLblTag.textColor = [UIColor orangeColor];
        }
    }
}
@end
