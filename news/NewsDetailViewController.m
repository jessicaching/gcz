//
//  NewsDetailViewController.m
//  gcz
//
//  Created by Jessica on 15/4/18.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "CommentsViewController.h"
#import "GCZCommon.h"

@interface NewsDetailViewController ()
{
    IBOutlet UITableView *mTableView;
    IBOutlet UITextField *mTextField;
    
    IBOutlet UIButton *mBtnComments;
}
- (IBAction)actionShare:(UIBarButtonItem *)sender;
- (IBAction)actionBack:(UIBarButtonItem *)sender;
- (IBAction)actionComments:(UIButton *)sender;
- (IBAction)actionWriteComments:(UIButton *)sender;
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTintColor:kColorMainRed];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
//    for (int i = 0; i < 1; ++i) {
//        NSString *cellString = [NSString stringWithFormat:@"NDCell%d", i];
//        [mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellString];
//    }
//    [mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NDCell2"];
    mBtnComments.layer.borderWidth = 0.5f;
    mBtnComments.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    mBtnComments.layer.cornerRadius = 2.f;
    mBtnComments.clipsToBounds = YES;
    mBtnComments.layer.masksToBounds = YES;
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellString = [NSString stringWithFormat:@"NDCell%ld", indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString forIndexPath:indexPath];
    // Configure the cell...
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heights[10] = {67, 25, 842, 30, 44, 44, 44, 44, 52, 44};
    return heights[indexPath.row];
}

- (IBAction)actionShare:(UIBarButtonItem *)sender {
    NSString *message = @"港大学生不愿到内地交流 副校长：那就别来港大 http://www.guancha.cn/local/2015_04_18_316447.shtml";
    NSArray *objectsToShare = @[message];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)actionBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)actionComments:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CommentsViewController *comments = [storyboard instantiateViewControllerWithIdentifier:@"CommentsViewController"];
    [self.navigationController pushViewController:comments animated:NO];
}

- (IBAction)actionWriteComments:(UIButton *)sender {
}
@end
