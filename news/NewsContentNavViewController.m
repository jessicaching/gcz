//
//  NewsContentNavViewController.m
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsContentNavViewController.h"
#import "GCZCommon.h"

@interface NewsContentNavViewController ()
{
    UIScrollView *mScrollView;
    NSInteger mButtonCount;
    UIImageView *mImageShadow;
}
@end

@implementation NewsContentNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mScrollView = [[UIScrollView alloc] initWithFrame:self.navigationBar.frame];
    mScrollView.showsHorizontalScrollIndicator = NO;
    mScrollView.showsVerticalScrollIndicator = NO;
    [self.navigationBar addSubview:mScrollView];
    
    mImageShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonbg"]];
    mImageShadow.frame = CGRectMake(5 * kFrameWRatio, 7, 70 * kFrameWRatio, 30);
    [mScrollView addSubview:mImageShadow];
//    NSArray *titleArray = [NSArray arrayWithObjects:@"要闻", @"政治", @"国际", @"军事", @"财经", @"科技", @"亚投行", @"资料·研究", nil];
//    [self loadButtons:titleArray];
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadButtons:(NSArray*)titleArray
{
//    mButtonCount = [[NSUserDefaults standardUserDefaults] integerForKey:kDataNewsButtonCount];
//    if (mButtonCount <= 0) {
//        mButtonCount = 8;
//    }
    mButtonCount = [titleArray count];
    mScrollView.contentSize = CGSizeMake(75 * kFrameWRatio * mButtonCount, CGRectGetHeight(mScrollView.frame));
    for (int i = 0; i < mButtonCount; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
//        button.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.4];
        button.frame = CGRectMake((5 + 75 * i) * kFrameWRatio, 7, 70 * kFrameWRatio, 30);
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:kColorMainRed forState:UIControlStateSelected];
//        [button setBackgroundImage:[UIImage imageNamed:@"buttonbg"] forState:UIControlStateSelected];
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(actionChange:) forControlEvents:UIControlEventTouchUpInside];
        [mScrollView addSubview:button];
//        if (i == 0) {
//            button.selected = YES;
//        }
    }
}

- (void)selectTag:(NSInteger)mTag
{
    for (UIButton *button in [mScrollView subviews]) {
        if ([button isKindOfClass:[UIImageView class]]) {
            continue;
        }
        if (button.tag == mTag) {
            button.selected = YES;
            mImageShadow.frame = CGRectMake((5 + 75 * mTag) * kFrameWRatio, 7, 70 * kFrameWRatio, 30);
        } else {
            button.selected = NO;
        }
    }
}

- (void)actionChange:(UIButton*)sender
{
    [self.mDelegate NewsContentNavViewControllerChange:sender.tag];
}

- (void)hideButtons:(BOOL)flag
{
    mScrollView.hidden = flag;
}

- (void)scrollButtons:(CGFloat)xRadio with:(NSInteger)index
{
    CGRect rect = mImageShadow.frame;
    rect.origin.x = (5 + xRadio * 75) * kFrameWRatio;
    mImageShadow.frame = rect;
    int count = self.navigationBar.frame.size.width / (75 * kFrameWRatio);
    if ((index + 1) >= count) {
        rect = mScrollView.frame;
        rect.origin.x = mScrollView.frame.origin.x - (count - index - 1) * (75 * kFrameWRatio);
        [mScrollView scrollRectToVisible:rect animated:YES];
//        mScrollView.contentOffset = CGPointMake(-(count - index - 1) * (75 * kFrameWRatio), 0);
    }
}

- (void)selectedButtons:(NSInteger)index
{
    for (UIButton *button in [mScrollView subviews]) {
        if ([button isKindOfClass:[UIImageView class]]) {
            continue;
        }
        if (button.tag == index) {
            button.selected = YES;
        } else {
            button.selected = NO;
        }
    }
}
@end
