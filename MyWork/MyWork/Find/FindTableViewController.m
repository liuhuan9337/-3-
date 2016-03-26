//
//  FirstTableViewController.m
//  WhereAreYou
//
//  Created by lanou3g on 16/3/14.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "FirstTableViewController.h"
#import "DetailViewController.h"
#import "FirstModel.h"
#import "SecondTableViewCell.h"
@interface FindTableViewController ()
@property(nonatomic,strong)NSMutableArray *dic;
@property(nonatomic,strong)NSMutableDictionary *diction;
@end

@implementation FindTableViewController
-(NSMutableDictionary *)diction
{
    if (!_diction) {
        _diction = [NSMutableDictionary dictionary];
    }
    return _diction;
}
-(NSMutableArray *)dic
{
    if (!_dic) {
        _dic = [NSMutableArray array];
    }
    return _dic;
}
-(void)root
{
    AVQuery *query = [AVQuery queryWithClassName:@"Boy"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count == 0) {
            
        }else{
            self.diction = objects[0];
            NSArray *arr = self.diction[@"testArray"];
            for (NSDictionary *dic in arr) {
                FirstModel *model = [[FirstModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [self.dic addObject:model];
            }
            [self.tableView reloadData];
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  数据的处理
     */
    [self root];
    
    
    
    
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    self.navigationItem.title = @"标题";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清除" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButton)];
    self.tableView.rowHeight = 200;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_id"];
    
}
- (void)leftBarButton
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setBool:NO forKey:@"Enter"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dic.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell_id = @"cell_id";
    
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    
//    if (!cell) {
//        cell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
//    }
//
    FirstModel *model = self.dic[indexPath.row];
    cell.first.text =  model.Time;
    cell.second.text = model.Biaoti;
    cell.thild.text = model.leixing;
    cell.four.text = model.xiaoqu;
    cell.fifth.text = model.didian;
    cell.Sixth.text = model.gengduo;
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *det = [[DetailViewController alloc] init];
    
    det.model = self.dic[indexPath.row];
    [self.navigationController pushViewController:det animated:YES];
    
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
