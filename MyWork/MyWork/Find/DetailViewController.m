//
//  DetailViewController.m
//  WhereAreYou
//
//  Created by lanou3g on 16/3/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DetailViewController.h"
#import "FirstModel.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"详细信息";
    self.view = [[[NSBundle mainBundle]loadNibNamed:@"DetailViewController" owner:self options:nil]lastObject];
    self.navigationController.navigationBar.translucent = NO;
    self.Biaoti.text = self.model.Biaoti;
    self.xiaoqu.text = self.model.xiaoqu;
    self.Time.text = self.model.Time;
    self.didian.text = self.model.didian;
    self.Naem.text = self.model.Name;
    self.aPhoneNumber.text = self.model.aPhoneNumber;
    self.QQ.text = self.model.QQ;
    self.leixing.text = self.model.leixing;
    self.genduo.text = self.model.gengduo;
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
