//
//  SelectViewController.m
//  MyWork
//
//  Created by Sea on 16/3/15.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "SelectViewController.h"
#import "FirstTableViewController.h"
#import "SelectPickerView.h"


@interface SelectViewController ()<SelectPickerViewDelegate>
@property(nonatomic,strong)UILabel *LeiXing;//类型
@property(nonatomic,strong)UILabel *WuPin;//物品
@property(nonatomic,strong)UIButton *ZhaoLing;//招领启事
@property(nonatomic,strong)UIButton *School;
@property(nonatomic,strong)UITextField *fieldOne;
@property(nonatomic,strong)UITextField *fieldTwo;
@property(nonatomic,strong)UIButton *SouSuo;//搜索
@property(nonatomic,strong)UIView *viewOne;
@property(nonatomic,strong)UIView *viewTwo;
//
@property (nonatomic, strong) UITextField *pickerViewTextField;

@property (nonatomic, strong) SelectPickerView *pickerView;
@property (nonatomic, assign) NSInteger flag;


@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //类型
    self.LeiXing = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.LeiXing.text = @"类型";
    [self.view addSubview:self.LeiXing];
    
    //物品类型
    self.WuPin = [[UILabel alloc]initWithFrame:CGRectMake(30,80, 100, 150)];
    self.WuPin.text = @"物品类型";
    [self.view addSubview:self.WuPin];
    
    //
    self.fieldOne = [[UITextField alloc]initWithFrame:CGRectMake(170, 85, 80, 30)];
self.fieldOne.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:self.fieldOne];
    
    self.fieldTwo = [[UITextField alloc]initWithFrame:CGRectMake(170, 140, 80, 30)];
    self.fieldTwo.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:self.fieldTwo];
    
    
    //view
    self.viewOne = [[UIView alloc]initWithFrame:CGRectMake(30, 125, 350, 1)];
    self.viewOne.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.viewOne];
    //
    self.viewTwo = [[UIView alloc]initWithFrame:CGRectMake(30, 180, 350, 1)];
    self.viewTwo.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.viewTwo];
    
    self.ZhaoLing = [UIButton buttonWithType:UIButtonTypeSystem];
    self.ZhaoLing.frame = CGRectMake(150, 75, 100, 50);
//    self.ZhaoLing.backgroundColor = [UIColor redColor];
    [self.ZhaoLing setTitle:@"招领启事" forState:UIControlStateNormal];
    [self.ZhaoLing addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.ZhaoLing];
    //
    self.School = [UIButton buttonWithType:UIButtonTypeSystem];
    self.School.frame = CGRectMake(150, 130, 100, 50);

    [self.School setTitle:@"校园卡" forState:UIControlStateNormal];
    [self.School addTarget:self action:@selector(ButtonNewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.School];
    
    
    self.SouSuo = [UIButton buttonWithType:UIButtonTypeSystem];
    self.SouSuo.frame = CGRectMake(30, 230, 350, 50);
    self.SouSuo.backgroundColor = [UIColor redColor];
    
    [self.SouSuo setTitle:@"搜索" forState:UIControlStateNormal];
    [self.SouSuo addTarget:self action:@selector(ButtonTwoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.SouSuo];
    
//    //边框
//    self.ZhaoLing.layer.borderColor = [[UIColor colorWithRed:150/200.0 green:150/200.0 blue:150/200.0 alpha:1.0]CGColor];
//    self.ZhaoLing.layer.borderWidth = 1.0;
   


}

//BUtton点击
-(void)ButtonAction:(UIButton *)sender{
    self.pickerView = [SelectPickerView initPickerView];
    self.pickerView.frame = CGRectMake(0, 400, 430, 280);
    _pickerView.shadowView.frame = self.view.frame;
    _pickerView.array = @[@"寻物启事",@"招领启事"];
    _pickerView.delegate = self;
    self.flag = 0;
    [self.view addSubview:_pickerView.shadowView];
    [self.view addSubview:_pickerView];
}
-(void)getString:(NSString *)selectString{
    if (_flag == 0) {
        [self.ZhaoLing setTitle:selectString forState:UIControlStateNormal];
        
    }else{
        [self.School setTitle:selectString forState:UIControlStateNormal];
        
    }
}
//
-(void)ButtonNewAction:(UIButton *)sender{
    self.pickerView = [SelectPickerView initPickerView];
    self.pickerView.frame = CGRectMake(0, 400, 430, 280);
    _pickerView.shadowView.frame = self.view.frame;
    _pickerView.array = @[@"校园卡",@"手机",@"衣服",@"书籍",@"钥匙",@"钱包",@"自行车",@"证件",@"电子产品",@"学习用品",@"体育用品",@"生活用品",@"其他"];
    _pickerView.delegate = self;
    self.flag = 1;
    [self.view addSubview:_pickerView.shadowView];
    [self.view addSubview:_pickerView];
}
//
-(void)ButtonTwoAction:(UIButton *)sender{

    FirstTableViewController *firstVC = [[FirstTableViewController alloc]init];
    firstVC.leixing = self.ZhaoLing.titleLabel.text;
    firstVC.leixingFirst = self.School.titleLabel.text;
    [self.navigationController pushViewController:firstVC animated:YES];


}





@end
