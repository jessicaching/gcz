//
//  NewsContentViewController.m
//  gcz
//
//  Created by Jessica on 15/4/17.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsContentViewController.h"
#import "NCComCell.h"
#import "NCImageCell.h"
#import "NCScrollCell.h"
#import "NewsDetailViewController.h"
#import "NewsDetailVideoViewController.h"
#import "NewsDetailImageViewController.h"

@interface NewsContentViewController () <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *mTableView;
    IBOutlet UISearchBar *mSearchBar;
}
@property (strong, nonatomic) NSArray *mDataArray;
@end

@implementation NewsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [mTableView registerClass:[NCComCell class] forCellReuseIdentifier:@"NCComCell"];
//    [mTableView registerClass:[NCImageCell class] forCellReuseIdentifier:@"NCImageCell"];
//    [mTableView registerClass:[NCScrollCell class] forCellReuseIdentifier:@"NCScrollCell"];
//    [mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;

    self.mDataArray = [self.mData objectForKey:@"list"];
    [mTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    CGRect rect = self.navigationController.navigationBar.frame;
//    rect.origin.y = 20;
//    rect.size.height = 44;
//    rect.size.width = mTableView.frame.size.width;
//    self.navigationController.navigationBar.frame = rect;
//    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
//    NSLog(@"content h=%f", newsContentNav.navigationBar.frame.size.height);
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
//- (void)viewWillAppear:(BOOL)animated
//{
//    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
//    [newsContentNav hideButtons:NO];
////    [self.mDelegate NewsContentViewControllerHideNavigationBar:NO];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    NewsContentNavViewController *newsContentNav = (NewsContentNavViewController*)self.navigationController;
//    [newsContentNav hideButtons:YES];
////    [self.mDelegate NewsContentViewControllerHideNavigationBar:YES];
//}

#pragma searchbardeleage
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    searchBar.text = @"";
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
    return [self.mDataArray count] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSArray *scrollData = [self.mData objectForKey:@"scrollimages"];
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
        NSDictionary *data = [self.mDataArray objectAtIndex:index];
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
    } else
    {
        NSDictionary *data = [self.mDataArray objectAtIndex:(indexPath.row - 1)];
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

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f", mTableView.contentOffset.y);
//    if (mTableView.contentOffset.y > - 20) {
//        mTableView.contentOffset = CGPointMake(0, 0);
//    } else {
//        mTableView.contentOffset = CGPointMake(0, -20);
//    }
//}
@end
