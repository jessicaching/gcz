//
//  NewsContentViewController.h
//  gcz
//
//  Created by Jessica on 15/4/17.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsContentNavViewController.h"

@protocol NewsContentDelegate <NSObject>

- (void)NewsContentViewControllerHideNavigationBar:(BOOL)flag;

@end
@interface NewsContentViewController : UIViewController
@property (assign, nonatomic) id<NewsContentDelegate> mDelegate;
@property (strong, nonatomic) NSDictionary *mData;
@property (strong, nonatomic) NewsContentNavViewController *mNav;
@end
