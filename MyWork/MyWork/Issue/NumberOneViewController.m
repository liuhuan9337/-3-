//
//  NumberOneViewController.m
//  MyWork
//
//  Created by lanou3g on 16/3/23.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "NumberOneViewController.h"
#import "SelectPickerNewView.h"
#import "NumberThreeViewController.h"

@interface NumberOneViewController ()<SelectPickerViewDelegate,ThreeViewControllerDelegate>
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

@property(nonatomic,strong)UITextField *textfield1;
@property(nonatomic,strong)UITextField *textfield2;
@property(nonatomic,strong)UIButton *textfield3;
@property(nonatomic,strong)UITextField *textfield4;
@property(nonatomic,strong)UITextField *textfield5;
@property(nonatomic,strong)UITextField *textfield6;
@property(nonatomic,strong)UITextField *textfield7;
@property(nonatomic,strong)UIButton *textfield8;
@property(nonatomic,strong)UITextView *textfield9;

//
@property(nonatomic,strong)UITextField *field;

@property(nonatomic,strong)UIButton *bu1;
@property(nonatomic,strong)UIButton *bu2;



@property (nonatomic, strong) UITextField *pickerViewTextField;

@property (nonatomic, strong) SelectPickerNewView *pickerView;
@property (nonatomic, assign) NSInteger flag;




@end

@implementation NumberOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    
    
    
    
    
    self.title = @"信息内容";
    
    self.Biao = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 50, 40)];
    
    //self.Biao.backgroundColor = [UIColor redColor];
    self.Biao.text = @"标题";
    [self.view addSubview:self.Biao];
 
    
    
    self.XiaoQu = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 40)];
    
    // self.XiaoQu.backgroundColor = [UIColor redColor];
    self.XiaoQu.text = @"校区";
    [self.view addSubview:self.XiaoQu];
    
  
    
    self.Time = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 50, 40)];
    
    // self.Time.backgroundColor = [UIColor redColor];
    self.Time.text = @"丢失时间";
    [self.view addSubview:self.Time];
    
  
    
    
    self.DiDian = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 50, 40)];
    
    //self.DiDian.backgroundColor = [UIColor redColor];
    self.DiDian.text = @"丢失地点";
    [self.view addSubview:self.DiDian];
    
   
    
    
    
    self.Name = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 50, 40)];
    
    //self.Name.backgroundColor = [UIColor redColor];
    self.Name.text = @"名字";
    [self.view addSubview:self.Name];
    
    self.PhoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(40, 250, 100, 40)];
    
    //self.PhoneNumber.backgroundColor = [UIColor redColor];
    self.PhoneNumber.text = @"手机号";
    [self.view addSubview:self.PhoneNumber];
    
    
    
    self.QQ = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 50, 40)];
    
    // self.QQ.backgroundColor = [UIColor redColor];
    self.QQ.text = @"QQ";
    [self.view addSubview:self.QQ];
    
    
    
    self.WuPin = [[UILabel alloc]initWithFrame:CGRectMake(30, 350, 100, 40)];
    
    //self.WuPin.backgroundColor = [UIColor redColor];
    self.WuPin.text = @"物品类型";
    
    [self.view addSubview:self.WuPin];
    
    
    // Textfield**************
    self.textfield1 = [[UITextField alloc]initWithFrame:CGRectMake(150, 0, 200, 40)];
    
    self.textfield1.placeholder = @"请输入标题";
    [self.view addSubview:self.textfield1];
    
    self.textfield2 = [[UITextField alloc]initWithFrame:CGRectMake(150, 50, 200, 40)];
    
    self.textfield2.placeholder = @"请输入校区";
    [self.view addSubview:self.textfield2];
    
    self.textfield3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.textfield3.frame = CGRectMake(100, 100, 200, 40);
    
    //self.textfield3.placeholder = @"请输入时间";
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    [self.textfield3 addGestureRecognizer:tap];
    [self.textfield3 setTitle:@"请输入时间" forState:UIControlStateNormal];
    [self.textfield3 addTarget:self action:@selector(textfield3Acton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.textfield3];
    
    
    self.textfield4 = [[UITextField alloc]initWithFrame:CGRectMake(150, 150, 200, 40)];
    
    self.textfield4.placeholder = @"请输入地点";
    [self.view addSubview:self.textfield4];
    
    
    self.textfield5 = [[UITextField alloc]initWithFrame:CGRectMake(150, 200, 200, 40)];
    
    self.textfield5.placeholder = @"请输入名字";
    [self.view addSubview:self.textfield5];
    
    self.textfield6 = [[UITextField alloc]initWithFrame:CGRectMake(150, 250, 200, 40)];
    
    self.textfield6.placeholder = @"请输入手机号";
    [self.view addSubview:self.textfield6];
    
    self.textfield7 = [[UITextField alloc]initWithFrame:CGRectMake(150, 300, 200, 40)];
    
    self.textfield7.placeholder = @"请输入QQ号";
    [self.view addSubview:self.textfield7];
    
    
    self.textfield8  = [UIButton buttonWithType:UIButtonTypeSystem];
    self.textfield8.frame = CGRectMake(100, 350, 200, 40);
    
   // self.textfield8.placeholder = @"请输入物品类型";
    [self.textfield8 setTitle:@"请输入物品类型" forState:UIControlStateNormal];
    [self.textfield8 addTarget:self action:@selector(textfield8Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.textfield8];
    
    
    
    
    
    
    self.textfield9 = [[UITextView alloc]initWithFrame:CGRectMake(20, 400, 370, 150)];
    
    //self.textfield9.borderStyle = UITextBorderStyleLine;
    
    self.textfield9.text = @"注:请填写完整的信息以便丢失物品更快地找回";
    
        //UIlabel 边框
        self.textfield9.layer.borderColor = [[UIColor colorWithRed:150/200.0 green:150/200.0 blue:150/200.0 alpha:1.0]CGColor];
        self.textfield9.layer.borderWidth = 1.0;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self.textfield9 addGestureRecognizer:tap];
    
    [self.view addSubview:self.textfield9];
    
    
    
 
    
    
    //********View 划线 区
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 370, 1)];
    self.view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc]initWithFrame:CGRectMake(20, 90, 370, 1)];
    self.view2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc]initWithFrame:CGRectMake(20, 140, 370, 1)];
    self.view3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view3];
    
    self.view4 = [[UIView alloc]initWithFrame:CGRectMake(20, 190, 370, 1)];
    self.view4.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view4];
    
    
    self.view5 = [[UIView alloc]initWithFrame:CGRectMake(20, 240, 370, 1)];
    self.view5.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view5];
    
    
    self.view6 = [[UIView alloc]initWithFrame:CGRectMake(20, 290, 370, 1)];
    self.view6.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view6];
    
    
    self.view7 = [[UIView alloc]initWithFrame:CGRectMake(20, 340, 370, 1)];
    self.view7.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view7];
    
    self.view8 = [[UIView alloc]initWithFrame:CGRectMake(20, 390, 370, 1)];
    self.view8.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view8];
    
    

    self.navigationController.navigationBar.translucent = NO;
    
    self.field.text = self.pssuae;
    
    // Do any additional setup after loading the view.
}
- (void)threeWithNsstring:(NSString *)str
{
    self.textfield9.text = str;
}
//发布点击**
-(void)rightItemAction:(UIBarButtonItem *)sender{

    NSLog(@"______");



}
//UItextview点击推出动画页面~
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    NumberThreeViewController *three = [[NumberThreeViewController alloc]init];
    three.delegate = self;
    
    [self presentViewController:three animated:YES completion:nil];
}


//*******
//输入日期
-(void)textfield3Acton:(UIButton *)sender{
    self.pickerView = [SelectPickerNewView initPickerView];
    self.pickerView.frame = CGRectMake(0, 400, 430, 280);
    _pickerView.shadowView.frame = self.view.frame;
    _pickerView.array = @[@"校园卡",@"手机"];
    _pickerView.delegate = self;
    self.flag = 0;
    [self.view addSubview:_pickerView.shadowView];
    [self.view addSubview:_pickerView];
}
-(void)getString:(NSString *)selectString{
    if (_flag == 0) {
        [self.textfield3 setTitle:selectString forState:UIControlStateNormal];
    }else{
        [self.textfield8 setTitle:selectString forState:UIControlStateNormal];
        
    }
}

//物品类型
-(void)textfield8Action:(UIButton *)sender{
    self.pickerView = [SelectPickerNewView initPickerView];
    self.pickerView.frame = CGRectMake(0, 400, 430, 280);
    _pickerView.shadowView.frame = self.view.frame;
     _pickerView.array = @[@"校园卡",@"手机",@"衣服",@"书籍",@"钥匙",@"钱包",@"自行车",@"证件",@"电子产品",@"学习用品",@"体育用品",@"生活用品",@"其他"];
    _pickerView.delegate = self;
    self.flag = 1;
    [self.view addSubview:_pickerView.shadowView];
    [self.view addSubview:_pickerView];


}




@end
