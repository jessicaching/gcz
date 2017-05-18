//
//  NCImageCell.h
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NCImageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *mLblTitle;

- (void)initData:(NSDictionary*)data;
@end
