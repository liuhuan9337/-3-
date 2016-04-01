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
#import "LendCloudModel.h"
#import "FirstModel.h"
#import "SecondTableViewController.h"
#import "enTerViewController.h"
@interface MyViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong)NSArray * array;

@property (nonatomic, strong)ShowDetailTableViewController * findAndLoseWithThing;
@property(nonatomic,strong)HeaderView *headerView;

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
    
    [self presentViewController:[enTerViewController new] animated:YES completion:nil];
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

//分区Header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *str = [user objectForKey:@"sstring"];
    self.headerView = [[HeaderView alloc]init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.headerView.imageView addGestureRecognizer:tap];
    self.headerView.imageView.userInteractionEnabled = YES;
    self.headerView.nameID.text = str;
    //替换视图
    return self.headerView;
    
}
- (void)tapAction
{
    NSLog(@"ajkflas");
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.allowsEditing = YES;
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
   self.headerView.imageView.image = info[UIImagePickerControllerEditedImage];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
    [LendCloudModel dataWithLendCloudOnblack:^(id object) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *str = [user objectForKey:@"Nsstring"];
        NSString * strFirst = @"招领启事";
        NSMutableArray *arraySecond =[NSMutableArray array];
     for (FirstModel *first in object) {
         
        if ([first.diu isEqualToString:strFirst]&& [first.liaotian isEqualToString:str]) {
                [arraySecond addObject:first];
            }
        }
        
        self.findAndLoseWithThing.array = nil;
        self.findAndLoseWithThing.array = arraySecond;
          [self.navigationController pushViewController:self.findAndLoseWithThing animated:YES];
    }];
  
}
//寻物启事方法
- (void)cellWithTwo:(NSInteger)indexRow
{
    NSLog(@"寻物");
    [LendCloudModel dataWithLendCloudOnblack:^(id object) {
        SecondTableViewController *second = [[SecondTableViewController alloc]init];
        NSArray *one = object;
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *str = [user objectForKey:@"Nsstring"];
        NSString * strFirst = @"寻物启事";
        NSMutableArray *arrayFirst =[NSMutableArray array];
        for (FirstModel *first in one) {
            if ([first.diu isEqual: strFirst] && [first.liaotian isEqual: str]) {
                [arrayFirst addObject:first];
            }
        }
        second.array = nil;
        second.array = arrayFirst;
        
        [self.navigationController pushViewController:second animated:YES];
    }];

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
