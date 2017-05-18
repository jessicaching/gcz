//
//  ColumnViewController.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "ColumnViewController.h"
#import "GCZCommon.h"

@interface ColumnViewController ()
{
    
}
@property (nonatomic, strong) NSArray *mCommentatorArray;
@property (nonatomic, strong) NSArray *mIndexArray;
@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:kColorMainRed];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
//    self.mCommentatorArray = [NSArray arrayWithObjects:
//                        [NSArray arrayWithObjects:@"爱德华·卢斯", @"英国《金融时报》华盛顿分社社长", nil],
//                        [NSArray arrayWithObjects:@"保罗·克鲁格曼", @"普林斯顿大学教授，诺贝尔经济学奖得主", nil], nil];
//    self.mIndexArray = [NSArray arrayWithObjects:@"A", @"B", nil];
    //
//    
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return self.mIndexArray;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return self.mIndexArray[section];
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return [self.mCommentatorArray count];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    // Configure the cell...
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.textLabel.text = [[self.mCommentatorArray objectAtIndex:indexPath.section] objectAtIndex:0];
//    cell.detailTextLabel.text = [[self.mCommentatorArray objectAtIndex:indexPath.section] objectAtIndex:1];
//    return cell;
//}

@end
