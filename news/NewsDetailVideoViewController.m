//
//  NewsDetailVideoViewController.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsDetailVideoViewController.h"
#import "NDVCell.h"
#import "GCZCommon.h"
#import "CommentsViewController.h"

@interface NewsDetailVideoViewController () 
{
    
}
- (IBAction)actionShare:(UIBarButtonItem *)sender;
- (IBAction)actionComments:(UIButton *)sender;
- (IBAction)actionWriteComments:(UIButton *)sender;
@end

@implementation NewsDetailVideoViewController

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

#pragma mark - Table view data source

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
        NDVCell *cell = (NDVCell*)[tableView dequeueReusableCellWithIdentifier:@"NDVCell" forIndexPath:indexPath];
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
    CGFloat heights[7] = {67, 25, 662, 30, 44, 44, 44};
    return heights[indexPath.row];
}

- (IBAction)actionShare:(UIBarButtonItem *)sender {
    NSString *message = @"邓紫棋《喜欢你》进驻广场舞 动作整齐节奏感堪称完美 http://www.guancha.cn/life/2015_04_18_316450.shtml";
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
