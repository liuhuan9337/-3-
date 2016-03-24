//
//  SecondViewController.m
//  MyWork
//
//  Created by lanou3g on 16/3/18.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong)UILabel *Biao;//标题
@property(nonatomic,strong)UILabel *XiaoQu;//校区
@property(nonatomic,strong)UILabel *Time;//时间
@property(nonatomic,strong)UILabel *DiDian;//地点
@property(nonatomic,strong)UILabel *Name;//姓名
@property(nonatomic,strong)UILabel *PhoneNumber;//手机号
@property(nonatomic,strong)UILabel *QQ;//QQ
@property(nonatomic,strong)UILabel *WuPin;//物品
@property(nonatomic,strong)UIView *view1;
@property(nonatomic,strong)UIView *view2;
@property(nonatomic,strong)UIView *view3;
@property(nonatomic,strong)UIView *view4;
@property(nonatomic,strong)UIView *view5;
@property(nonatomic,strong)UIView *view6;
@property(nonatomic,strong)UIView *view7;
@property(nonatomic,strong)UIView *view8;



@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情信息";
    
    self.Biao = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 50, 40)];
    
    //self.Biao.backgroundColor = [UIColor redColor];
    self.Biao.text = @"标题";
    [self.view addSubview:self.Biao];
    
    
    self.XiaoQu = [[UILabel alloc]initWithFrame:CGRectMake(50, 120, 50, 40)];
    
   // self.XiaoQu.backgroundColor = [UIColor redColor];
    self.XiaoQu.text = @"校区";
    [self.view addSubview:self.XiaoQu];
    
    self.Time = [[UILabel alloc]initWithFrame:CGRectMake(50, 170, 50, 40)];
    
   // self.Time.backgroundColor = [UIColor redColor];
    self.Time.text = @"时间";
    [self.view addSubview:self.Time];
    
    self.DiDian = [[UILabel alloc]initWithFrame:CGRectMake(50, 220, 50, 40)];
    
    //self.DiDian.backgroundColor = [UIColor redColor];
    self.DiDian.text = @"地点";
    [self.view addSubview:self.DiDian];
    
    
    
    
    self.Name = [[UILabel alloc]initWithFrame:CGRectMake(50, 270, 50, 40)];
    
    //self.Name.backgroundColor = [UIColor redColor];
    self.Name.text = @"名字";
    [self.view addSubview:self.Name];
    
    
    
    
    self.PhoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(40, 320, 100, 40)];
    
    //self.PhoneNumber.backgroundColor = [UIColor redColor];
    self.PhoneNumber.text = @"手机号";
    [self.view addSubview:self.PhoneNumber];
    
    
    
    self.QQ = [[UILabel alloc]initWithFrame:CGRectMake(50, 370, 50, 40)];
    
   // self.QQ.backgroundColor = [UIColor redColor];
    self.QQ.text = @"QQ";
    [self.view addSubview:self.QQ];
    
    
    
    self.WuPin = [[UILabel alloc]initWithFrame:CGRectMake(30, 420, 100, 40)];
    
    //self.WuPin.backgroundColor = [UIColor redColor];
    self.WuPin.text = @"物品类型";
    [self.view addSubview:self.WuPin];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 110, 370, 1)];
    self.view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view1];

    self.view2 = [[UIView alloc]initWithFrame:CGRectMake(20, 160, 370, 1)];
    self.view2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc]initWithFrame:CGRectMake(20, 210, 370, 1)];
    self.view3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view3];
    
    self.view4 = [[UIView alloc]initWithFrame:CGRectMake(20, 260, 370, 1)];
    self.view4.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view4];
    
    
    self.view5 = [[UIView alloc]initWithFrame:CGRectMake(20, 310, 370, 1)];
    self.view5.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view5];
    
    
    self.view6 = [[UIView alloc]initWithFrame:CGRectMake(20, 360, 370, 1)];
    self.view6.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view6];
    
    
    self.view7 = [[UIView alloc]initWithFrame:CGRectMake(20, 410, 370, 1)];
    self.view7.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view7];
    
    self.view8 = [[UIView alloc]initWithFrame:CGRectMake(20, 460, 370, 1)];
    self.view8.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view8];
}



@end
