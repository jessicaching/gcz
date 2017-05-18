//
//  TopicViewController.m
//  gcz
//
//  Created by Jessica on 15/4/17.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "TopicViewController.h"
#import "NewsContentNavViewController.h"

@interface TopicViewController () <NewsContentNavDelegate>
{
    IBOutlet UITableView *mTableView;
}
@property (nonatomic, strong) NSArray *mTopicTitleArray;
@property (nonatomic, strong) NSArray *mTopicArray;
@property (nonatomic, strong) NSArray *mIndexArray;
@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.mTopicTitleArray = [NSArray arrayWithObjects:@"所有", @"思想文化", @"人物", @"国际战略", @"政治社会", @"军工科技", @"产业经济", nil];
    self.mTopicArray = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"1980世代", nil],
                        [NSArray arrayWithObjects:@"2015地方两会", nil],
                        [NSArray arrayWithObjects:@"ABC辱华", nil],
                        [NSArray arrayWithObjects:@"爸爸去哪儿", @"奔跑吧兄弟", nil],
                        [NSArray arrayWithObjects:@"大家都在看", @"当代妇女解放", nil],
                        [NSArray arrayWithObjects:@"俄罗斯之声", nil],
                        [NSArray arrayWithObjects:@"反法西斯胜利70年", nil],
                        [NSArray arrayWithObjects:@"国产动画", @"干涉马里", nil],
                        [NSArray arrayWithObjects:@"哈尔滨越狱", nil],
                        [NSArray arrayWithObjects:@"IT新浪潮", nil],
                        [NSArray arrayWithObjects:@"甲午马年", nil],
                        [NSArray arrayWithObjects:@"客机坠毁法国", nil],
                        [NSArray arrayWithObjects:@"兰州水污染", nil],
                        [NSArray arrayWithObjects:@"马航飞机失踪", nil],
                        [NSArray arrayWithObjects:@"奶粉限购", nil],
                        [NSArray arrayWithObjects:@"欧债危机", nil],
                        [NSArray arrayWithObjects:@"盘点2013", nil],
                        [NSArray arrayWithObjects:@"起底郭美美", nil],
                        [NSArray arrayWithObjects:@"人民币国际化", nil],
                        [NSArray arrayWithObjects:@"四个全面", nil],
                        [NSArray arrayWithObjects:@"泰国政局", nil],
                        [NSArray arrayWithObjects:@"网络热词", @"外滩踩踏事件", nil],
                        [NSArray arrayWithObjects:@"希腊退欧", nil],
                        [NSArray arrayWithObjects:@"亚投行", nil],
                        [NSArray arrayWithObjects:@"最后的乡愁", @"占领中环", nil], nil];
    self.mIndexArray = [NSArray arrayWithObjects:@"1", @"2", @"A", @"B", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"W", @"X", @"Y", @"Z", nil];
    NewsContentNavViewController *newContentNav = (NewsContentNavViewController*)self.navigationController;
    [newContentNav loadButtons:self.mTopicTitleArray];
    [newContentNav selectTag:0];
    newContentNav.mDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.mIndexArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.mIndexArray[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.mTopicArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.mTopicArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [[self.mTopicArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)NewsContentNavViewControllerChange:(NSInteger)index
{
    NewsContentNavViewController *newContentNav = (NewsContentNavViewController*)self.navigationController;
    [newContentNav selectTag:index];
}
@end
