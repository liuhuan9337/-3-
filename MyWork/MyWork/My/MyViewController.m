//
//  MyViewController.m
//  MyWork
//
//  Created by Sea on 16/3/30.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "MyViewController.h"
#import "HeaderView.h"
#import "ShowDetailTableViewController.h"
@interface MyViewController ()

@property (nonatomic, strong)NSArray * array;

@property (nonatomic, strong)ShowDetailTableViewController * findAndLoseWithThing;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"我的招领启事",@"我的寻物启事",@"清除缓存"];
    self.findAndLoseWithThing = [[ShowDetailTableViewController alloc]init];
    UIBarButtonItem * cancel = [[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];
    
    self.navigationItem.rightBarButtonItem = cancel;
    
    
    
    
}


//退出登录方法登录方法
- (void)cancelAction:(UIBarButtonItem *)sender
{
#pragma mark  没写
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_my"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_my"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

//分区Header高度
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView * headerView = [[HeaderView alloc]init];
    //替换视图
    return headerView;
    
}

//选中cell执行方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",indexPath.row);
    switch (indexPath.row) {
        case 0:
            //招领启事
            [self cellWithOne:indexPath.row];
            break;
        case 1:
            //寻物启事
            [self cellWithTwo:indexPath.row];
            break;
        default:
            //清除缓存
            [self cellWithThree:indexPath.row];
            break;
    }
    
}

//招领启事方法
- (void)cellWithOne:(NSInteger)indexRow
{
    NSLog(@"招领");
    [self.navigationController pushViewController:self.findAndLoseWithThing animated:YES];
}
//寻物启事方法
- (void)cellWithTwo:(NSInteger)indexRow
{
    NSLog(@"寻物");
    [self.navigationController pushViewController:self.findAndLoseWithThing animated:YES];

}

//清除缓存
- (void)cellWithThree:(NSInteger)indexRow
{
    NSLog(@"清除缓存");
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
