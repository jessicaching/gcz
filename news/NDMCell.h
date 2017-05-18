//
//  NDMCell.h
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCZCommon.h"

@interface NDMCell : UITableViewCell <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *mScrollView;
    IBOutlet UITextView *mTextView;
}
@end
