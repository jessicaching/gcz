//
//  NewsContentNavViewController.h
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKNavigationController.h"

@protocol NewsContentNavDelegate <NSObject>

- (void)NewsContentNavViewControllerChange:(NSInteger)index;

@end
@interface NewsContentNavViewController : KKNavigationController

@property (strong, nonatomic) NSArray *mTitleArray;

@property (nonatomic, assign) id<NewsContentNavDelegate> mDelegate;

- (void)selectTag:(NSInteger)mTag;
- (void)loadButtons:(NSArray*)titleArray;
- (void)hideButtons:(BOOL)flag;
- (void)scrollButtons:(CGFloat)xRadio with:(NSInteger)index;
- (void)selectedButtons:(NSInteger)index;
@end
