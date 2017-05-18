//
//  NewsViewController.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsViewController.h"
//#import "NewsPageViewController.h"
#import "NewsContentNavViewController.h"
//#import "NewsContentViewController.h"
#import "GCZCommon.h"
#import "NCScrollCell.h"
#import "NCComCell.h"
#import "NCImageCell.h"
#import "NewsDetailViewController.h"
#import "NewsDetailVideoViewController.h"
#import "NewsDetailImageViewController.h"

@interface NewsViewController () <NewsContentNavDelegate, UITableViewDataSource, UITableViewDelegate>
{
//    NewsPageViewController *mNewsPage;
    IBOutlet UIScrollView *mScrollView;
    IBOutlet UISearchBar *mSearchBar;
    NSMutableArray *mTableViewArray;
    NSInteger mPageIndex;
    IBOutlet UITableView *mTableView0;
    IBOutlet UITableView *mTableView1;
    IBOutlet UITableView *mTableView2;
    IBOutlet UITableView *mTableView3;
    IBOutlet UITableView *mTableView4;
    IBOutlet UITableView *mTableView5;
    IBOutlet UITableView *mTableView6;
    IBOutlet UITableView *mTableView7;
}
@property (nonatomic, nonatomic) NSArray *mPageContent;
@end

@implementation NewsViewController
@synthesize mPageContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.tintColor = kColorMainRed;
    [self.navigationController.navigationBar setTintColor:kColorMainRed];

    mPageIndex = 0;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"gczdata" ofType:@"plist"];
    mPageContent = [NSArray arrayWithContentsOfFile:plistPath];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"要闻", @"政治", @"国际", @"军事", @"财经", @"科技", @"亚投行", @"资料·研究", nil];
    mTableViewArray = [[NSMutableArray alloc] init];
    [mTableViewArray addObject:mTableView0];
    [mTableViewArray addObject:mTableView1];
    [mTableViewArray addObject:mTableView2];
    [mTableViewArray addObject:mTableView3];
    [mTableViewArray addObject:mTableView4];
    [mTableViewArray addObject:mTableView5];
    [mTableViewArray addObject:mTableView6];
    [mTableViewArray addObject:mTableView7];
//    for (UITableView *tableView in mTableViewArray) {
//        [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//        tableView.tableHeaderView = nil;
//    }

    CGFloat w = CGRectGetWidth(mScrollView.frame);//kScreenWidth;//
    CGFloat h = kScreenHeight - (64+49);//CGRectGetHeight(mScrollView.frame);//
//    NSLog(@"sc x=%f,y=%f,w=%f,h=%f", mScrollView.frame.origin.x, mScrollView.frame.origin.y, mScrollView.frame.size.width, mScrollView.frame.size.height);
//    NSLog(@"w=%f,h=%f", w, h);
    for (int i = 0; i < [titleArray count]; ++i) {
        UITableView *tableView = [mTableViewArray objectAtIndex:i];
        tableView.frame = CGRectMake(i * w, 0, w, kScreenHeight - 49 - 5);
        tableView.tag = i;
        NSIndexPath *localIndexPath = [NSIndexPath indexPathForRow:5 inSection:0];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:localIndexPath];
        [tableView scrollRectToVisible:cell.frame animated:YES];
        
//        [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//        CGRect rt = tableView.tableHeaderView.frame;
//        rt.size.height = 0;
//        tableView.tableHeaderView.frame = rt;
//        [tableView setFrame:CGRectMake(tableView.frame.origin.x, -40*kFrameHRatio, tableView.frame.size.width, tableView.frame.size.height)];

    }
    [mTableView0 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    mScrollView.contentSize = CGSizeMake(w * [titleArray count], h);
    mScrollView.tag = 8888;
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    for (int i = 0; i < [titleArray count]; ++i) {
//        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(w * i, 0, w, h) style:UITableViewStylePlain];
//        tableView.tag = i;
//        [mTableViewArray addObject:tableView];
//        [mScrollView addSubview:tableView];
//    }
    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;//[storyboard instantiateViewControllerWithIdentifier:@"NewsContentNavViewController"];//
    [newsContentNav.navigationBar setTintColor:kColorMainRed];
    newsContentNav.mDelegate = self;
    [newsContentNav loadButtons:titleArray];
    [newsContentNav selectTag:0];
//    mNewsPage = [storyboard instantiateViewControllerWithIdentifier:@"NewsPageViewController"];
//    NewsContentViewController *newsContent = [storyboard instantiateViewControllerWithIdentifier:@"NewsContentViewController"];
//    [self addChildViewController:mNewsPage];
//    newsContent.mData = [self.mPageContent objectAtIndex:0];
//    newsContent.mDelegate = self;
//    [mScrollView addSubview:newsContent.view];
//    [newsContentNav pushViewController:mNewsPage animated:NO];
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
    [newsContentNav hideButtons:NO];
//    [self.mDelegate NewsContentViewControllerHideNavigationBar:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
    [newsContentNav hideButtons:YES];
//    [self.mDelegate NewsContentViewControllerHideNavigationBar:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    for (int i = 0; i < [self.mPageContent count]; ++i) {
        UITableView *tableView = [mTableViewArray objectAtIndex:i];
        [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)NewsContentNavViewControllerChange:(NSInteger)index
{
    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
    [newsContentNav selectTag:index];
//    NSLog(@"nav1 x=%f,y=%f,w=%f,h=%f", newsContentNav.navigationBar.frame.origin.x, newsContentNav.navigationBar.frame.origin.y, newsContentNav.navigationBar.frame.size.width, newsContentNav.navigationBar.frame.size.height);
//    NSLog(@"navold x=%f,y=%f,w=%f,h=%f", self.navigationController.navigationBar.frame.origin.x, self.navigationController.navigationBar.frame.origin.y, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height);
    mPageIndex = index;
    [mScrollView scrollRectToVisible:CGRectMake(index * CGRectGetWidth(mScrollView.frame), 0, CGRectGetWidth(mScrollView.frame), CGRectGetWidth(mScrollView.frame)) animated:YES];
//    [mNewsPage changePage:index];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSDictionary *data = [self.mPageContent objectAtIndex:tableView.tag];
    return [[data objectForKey:@"list"] count] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *pageData = [self.mPageContent objectAtIndex:tableView.tag];
    if (indexPath.row == 0) {
        NSArray *scrollData = [pageData objectForKey:@"scrollimages"];
        //        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        //        cell.textLabel.text = [[scrollData objectAtIndex:0] objectForKey:@"title"];
        NCScrollCell *cell = (NCScrollCell*)[tableView dequeueReusableCellWithIdentifier:@"NCScrollCell" forIndexPath:indexPath];
        //        NCScrollCell *cell = (NCScrollCell*)[tableView dequeueReusableCellWithIdentifier:@"NCScrollCell" forIndexPath:indexPath];
        //        cell.mImageView.image = [[scrollData objectAtIndex:0] objectForKey:@"image"];
        //        cell.mLblTitle.text = [[scrollData objectAtIndex:0] objectForKey:@"title"];
        [cell initData:scrollData];
        // Configure the cell...
        return cell;
    } else {
        NSInteger index = indexPath.row - 1;
        
        NSDictionary *data = [[pageData objectForKey:@"list"] objectAtIndex:index];
        if ([[data objectForKey:@"type"] integerValue] == 1) { //image
            NCImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NCImageCell" forIndexPath:indexPath];
            //            cell.m = [[scrollData objectAtIndex:0] objectForKey:@"image"];
            //            cell.mLblTitle.text = [[scrollData objectAtIndex:0] objectForKey:@"title"];
            // Configure the cell...
            return cell;
        }
        //      if ([[data objectForKey:@"type"] integerValue] == 2) { //video
        //            NSDictionary *data = [self.mDataArray objectAtIndex:indexPath.row];
        //            NCComCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NCComCell" forIndexPath:indexPath];
        //            // Configure the cell...
        //            [cell initData:data with:indexPath.row];
        //            return cell;
        //        }
        else { //common
            NCComCell *cell = (NCComCell*)[tableView dequeueReusableCellWithIdentifier:@"NCComCell" forIndexPath:indexPath];
            [cell initData:data with:index];
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NewsDetailViewController *newsDetail = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
        [self.navigationController pushViewController:newsDetail animated:NO];
    } else {
        NSDictionary *pageData = [self.mPageContent objectAtIndex:tableView.tag];
        NSDictionary *data = [[pageData objectForKey:@"list"] objectAtIndex:(indexPath.row - 1)];
        if ([[data objectForKey:@"type"] integerValue] == 2) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            NewsDetailVideoViewController *newsDetail = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailVideoViewController"];
            [self.navigationController pushViewController:newsDetail animated:NO];
        } else if ([[data objectForKey:@"type"] integerValue] == 1) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            NewsDetailImageViewController *newsDetail = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailImageViewController"];
            [self.navigationController pushViewController:newsDetail animated:NO];
        } else {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            NewsDetailViewController *newsDetail = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
            [self.navigationController pushViewController:newsDetail animated:NO];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 8888) {
        int contentOffsetX = scrollView.contentOffset.x;
        int width =  CGRectGetWidth(mScrollView.frame);
        mPageIndex = contentOffsetX / width;
        NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
        CGFloat xRadio = scrollView.contentOffset.x / scrollView.frame.size.width;
        [newsContentNav scrollButtons:xRadio with:mPageIndex];
        [newsContentNav selectedButtons:mPageIndex];

    } else if (scrollView.tag < [self.mPageContent count] && scrollView.contentOffset.y < 0) {
//        UITableView *tableView = [mTableViewArray objectAtIndex:scrollView.tag];
//        NSInteger height = 40;
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.1f];
//        tableView.tableHeaderView.frame = CGRectMake(0, 0,  mTableView0.frame.size.width, height);
//        [UIView commitAnimations];
//        [tableView scrollRectToVisible:CGRectMake(0, scrollView.contentOffset.y,  mTableView0.frame.size.width,  mTableView0.frame.size.height) animated:YES];
//        [tableView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:NO];
//        [tableView setFrame:CGRectMake(tableView.frame.origin.x, 0, tableView.frame.size.width, tableView.frame.size.height)];
    }

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
}

@end
