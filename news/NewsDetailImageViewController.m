//
//  NewsDetailImageViewController.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsDetailImageViewController.h"
#import "CommentsViewController.h"
#import "NDMCell.h"

@interface NewsDetailImageViewController ()

- (IBAction)actionShare:(UIBarButtonItem *)sender;
@end

@implementation NewsDetailImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"观察者";
    [self.navigationController.navigationBar setTintColor:kColorMainRed];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        NDMCell *cell = (NDMCell*)[tableView dequeueReusableCellWithIdentifier:@"NDMCell" forIndexPath:indexPath];
        // Configure the cell...
        return cell;
    } else {
        NSString *cellString = [NSString stringWithFormat:@"NDCell%ld", indexPath.row];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString forIndexPath:indexPath];
        // Configure the cell...
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heights[7] = {67, 25, 315, 30, 44, 44, 44};
    return heights[indexPath.row];
}

- (IBAction)actionShare:(UIBarButtonItem *)sender {
    NSString *message = @"日本首相安倍参加年度赏樱大会 http://news.qq.com/a/20150418/023785.htm#p=1";
    NSArray *objectsToShare = @[message];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)actionComments:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CommentsViewController *comments = [storyboard instantiateViewControllerWithIdentifier:@"CommentsViewController"];
    [self.navigationController pushViewController:comments animated:NO];
}

- (IBAction)actionWriteComments:(UIButton *)sender {
}
@end
