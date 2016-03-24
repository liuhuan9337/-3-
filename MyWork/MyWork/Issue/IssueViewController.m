//
//  IssueViewController.m
//  MyWork
//
//  Created by Sea on 16/3/15.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "IssueViewController.h"
#import "NumberOneViewController.h"
#import "NumberTwoViewController.h"

@interface IssueViewController ()
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UIButton *button1;

@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"失物招领" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(100, 100, 200, 30);
    self.button.backgroundColor = [UIColor redColor];
    [self.button addTarget:self action:@selector(ButtonActon:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button1 setTitle:@"招领启事" forState:UIControlStateNormal];
    self.button1.frame = CGRectMake(100, 170, 200, 30);
        self.button1.backgroundColor = [UIColor redColor];
    [self.button1  addTarget:self action:@selector(Button1Acton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    
  
    
    
    
}
-(void)ButtonActon:(UIButton *)sender{
    NumberOneViewController *num = [[NumberOneViewController alloc]init];
    
    [self.navigationController pushViewController:num animated:YES];
    
}
-(void)Button1Acton:(UIButton *)sender{
    
    NumberTwoViewController *numT = [[NumberTwoViewController alloc]init];
    
    [self.navigationController pushViewController:numT animated:YES];
    




}


@end
