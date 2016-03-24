//
//  DetailViewController.m
//  WhereAreYou
//
//  Created by lanou3g on 16/3/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"详细信息";
    self.view = [[[NSBundle mainBundle]loadNibNamed:@"DetailViewController" owner:self options:nil]lastObject];
    
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

@end
