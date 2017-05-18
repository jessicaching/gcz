//
//  NewsPageViewController.m
//  gcz
//
//  Created by Jessica on 15/4/17.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsPageViewController.h"
#import "NewsContentViewController.h"
#import "NewsContentNavViewController.h"
#import "GCZCommon.h"

@interface NewsPageViewController () <NewsContentDelegate>
{
    
}
@property (nonatomic, nonatomic) NSArray *mPageContent;
@end

@implementation NewsPageViewController
@synthesize mPageContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBarController.tabBar.tintColor = kColorMainRed;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
//    [self.navigationController.navigationBar setTintColor:kColorMainRed];
//    CGRect rect = self.view.frame;
//    rect.origin.y = 64;
//    self.view.frame = rect;

    self.navigationItem.hidesBackButton = YES;
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"gczdata" ofType:@"plist"];
    mPageContent = [NSArray arrayWithContentsOfFile:plistPath];
    NewsContentViewController *newsContent = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:newsContent];
    [self setViewControllers:viewControllers
                              direction:UIPageViewControllerNavigationDirectionForward
                               animated:NO
                             completion:nil];
//    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"page h=%f", self.navigationController.navigationBar.frame.size.height);
    if (self.navigationController == nil || self.navigationController.navigationBar.frame.size.height == 0) {
        CGRect rect = self.view.frame;
        rect.origin.y = 64;
        self.view.frame = rect;
    }

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

// 得到相应的VC对象
- (NewsContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.mPageContent count] == 0) || (index >= [self.mPageContent count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NSArray *titleArray = [NSArray arrayWithObjects:@"要闻", @"政治", @"国际", @"军事", @"财经", @"科技", @"亚投行", @"资料·研究", nil];
    NewsContentViewController *newsContent = [storyboard instantiateViewControllerWithIdentifier:@"NewsContentViewController"];//(NewsContentViewController*)[newsContentNav topViewController];//
    newsContent.mData = [self.mPageContent objectAtIndex:index];
    newsContent.mDelegate = self;
//    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;//[[NewsContentNavViewController alloc] initWithRootViewController:newsContent];//[storyboard instantiateViewControllerWithIdentifier:@"NewsContentNavViewController"];//
//    [newsContentNav.navigationBar setTintColor:kColorMainRed];
//    newsContentNav.navigationBar.barTintColor = kColorMainBG;
//    newsContentNav.mDelegate = self;
//    [newsContentNav loadButtons:titleArray];
//    [newsContentNav selectTag:index];
//    newsContent.mNav = newsContentNav;
    return newsContent;
}

// 根据数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(NewsContentViewController *)viewController {
    return [self.mPageContent indexOfObject:viewController.mData];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    
}

- (void)changePage:(NSInteger)index
{
    NewsContentViewController *newsContent = [self viewControllerAtIndex:index];
    UINavigationController *nav = newsContent.navigationController;
    if (nav == nil || nav.navigationBar.frame.size.height == 0) {
        CGRect rect = newsContent.view.frame;
        rect.origin.y = 64;
        rect.size.height = newsContent.view.frame.size.height - 64;
        newsContent.view.frame = rect;
    }

    NSArray *viewControllers = [NSArray arrayWithObject:newsContent];
    [self setViewControllers:viewControllers
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

- (void)NewsContentViewControllerHideNavigationBar:(BOOL)flag
{
    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
    [newsContentNav hideButtons:flag];
}

//- (void)NewsContentNavViewControllerChange:(NSInteger)index
//{
//    [self changePage:index];
//}

@end
