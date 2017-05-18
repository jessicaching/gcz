//
//  NCComCell.h
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NCComCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *mImageView;
@property (strong, nonatomic) IBOutlet UILabel *mLblTitle;
@property (strong, nonatomic) IBOutlet UILabel *mLblIntro;
@property (strong, nonatomic) IBOutlet UILabel *mLblComments;
@property (strong, nonatomic) IBOutlet UILabel *mLblTag;

- (void)initData:(NSDictionary*)data with:(NSInteger)index;
@end
