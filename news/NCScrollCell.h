//
//  NCScrollCell.h
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCZCommon.h"

@interface NCScrollCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *mImageView;
@property (strong, nonatomic) IBOutlet UIImageView *mImageViewAd;
@property (strong, nonatomic) IBOutlet UILabel *mLblTitle;

- (void)initData:(NSArray*)data;
@end
