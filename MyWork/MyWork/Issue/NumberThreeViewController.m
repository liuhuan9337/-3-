//
//  NumberThreeViewController.m
//  MyWork
//
//  Created by 刘欢 on 16/3/24.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "NumberThreeViewController.h"
#import "Rootview.h"
@interface NumberThreeViewController ()
@property(nonatomic,strong)Rootview *rootViews;
@end

@implementation NumberThreeViewController
//-(void)viewDidAppear:(BOOL)animated
//{
//    self.rootViews = [[Rootview alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2)];
//    self.view = self.rootViews;
//}


- (void)loadView
{
    
    self.rootViews = [[Rootview alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
#warning message    ?????????
//    self.rootViews = [[Rootview alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.view = self.rootViews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootViews.button setTitle:@"取消" forState:UIControlStateNormal];
    [self.rootViews.buttonFirst setTitle:@"确定" forState:UIControlStateNormal];
    [self.rootViews.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rootViews.buttonFirst addTarget:self action:@selector(buttonFirstAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)buttonFirstAction
{
    
    [self.delegate threeWithNsstring:self.rootViews.textfield.text];
    [self dismissViewControllerAnimated:YES completion:nil];
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
