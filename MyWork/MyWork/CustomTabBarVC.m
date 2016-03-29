//
//  CustomTabBarVC.m
//  CustomTab
//
//  Created by Sea on 16/3/14.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "CustomTabBarVC.h"
#import "ChatListViewController.h"
#import <CDChatManager.h>
#define KWidthScreen [UIScreen mainScreen].bounds.size.width
#define KheightScreen [UIScreen mainScreen].bounds.size.height


@interface CustomTabBarVC ()<UINavigationControllerDelegate>

@property (nonatomic, strong)ChatListViewController * friendVC;

@end

@implementation CustomTabBarVC
- (void)viewdidControl
{
  
    //我的界面
    MyViewController * myTV = [[MyViewController alloc]init];
    myTV.navigationItem.title = @"我的";
    myTV.view.backgroundColor = [UIColor redColor];
    UINavigationController * myNC = [[UINavigationController alloc]initWithRootViewController:myTV];
    
    
    //搜索界面
    SelectViewController * selectVC = [[SelectViewController alloc]init];
    selectVC.navigationItem.title = @"搜索";
    selectVC.view.backgroundColor = [UIColor brownColor];
    UINavigationController * selectNC = [[UINavigationController alloc]initWithRootViewController:selectVC];
    
    //发布界面
    IssueViewController * issueVC = [[IssueViewController alloc]init];
    issueVC.navigationItem.title = @"发布消息";
    issueVC.view.backgroundColor = [UIColor blueColor];
    UINavigationController * issueNC = [[UINavigationController alloc]initWithRootViewController:issueVC];
    
    //好友列表
//    FriendListTableViewController * friendVC = [[FriendListTableViewController alloc]init];
    
     self.friendVC = [[ChatListViewController alloc]init];
    
    self.friendVC.navigationItem.title = @"会话列表";
//    self.friendVC.view.backgroundColor = [UIColor purpleColor];
    UINavigationController * friendNC = [[UINavigationController alloc] initWithRootViewController:self.friendVC];
    
    //发现列表
    FindTableViewController * findVC = [[FindTableViewController alloc]init];
    findVC.navigationItem.title = @"发现";
    findVC.view.backgroundColor = [UIColor grayColor];
    UINavigationController * findNC = [[UINavigationController alloc]initWithRootViewController:findVC];
    self.viewControllers = [NSArray arrayWithObjects:findNC,friendNC,issueNC,selectNC,myNC, nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //这里是为了每次首次进入都能加载第一个视图
        _selectedIndex = -1;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewdidControl];
    self.customView = [[UIView alloc]initWithFrame:CGRectMake(0, KheightScreen - 80, KWidthScreen, 80)];
    [self.view addSubview:self.customView];
    
    
    //正常状态下按钮图片
    self.nomalImageArray = [[NSArray alloc]initWithObjects:@"tabbar_button_notes_normal.png",@"tabbar_button_updates_normal.png",@"tabbar_button_centeradd.png",@"tabbar_button_sessions_normal.png",@"tabbar_button_binders_normal.png", nil];
    
    //高亮状态下按钮图片
    self.hightlightedImageArray = [[NSArray alloc]initWithObjects:@"tabbar_button_notes_selected.png",@"tabbar_button_updates_selected.png",@"tabbar_button_centeradd.png",@"tabbar_button_sessions_selected.png",@"tabbar_button_binders_selected.png",nil];
    //设置imageView图片
    self.customImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, KWidthScreen, 60)];
    [self.customImageView setImage:[UIImage imageNamed:@"tabbar_background.png"]];
    [self.customView addSubview:self.customImageView];
    
    
    
    //设置button的背景图片
    //OneBtn
    self.oneBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, (KWidthScreen - 84) / 4, 60)];
    [self.oneBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_button_notes_normal.png"] forState:UIControlStateNormal];
    self.oneBtn.tag = 1;
    
    [self.customView addSubview:self.oneBtn];
    
    
    //TwoBtn
    self.twoBtn = [[UIButton alloc]initWithFrame:CGRectMake((KWidthScreen - 84)/4, 20, (KWidthScreen - 84)/4, 60)];
    [self.twoBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_button_updates_normal.png"] forState:UIControlStateNormal];
    
    self.twoBtn.tag = 2;
    [self.customView addSubview:self.twoBtn];
    
    
    //ThreeOne
    self.threeBtn = [[UIButton alloc]initWithFrame:CGRectMake((KWidthScreen - 84) / 4 * 2, 0, 84, 80)];
    [self.threeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_button_centeradd.png"] forState:UIControlStateNormal];
    self.threeBtn.tag = 3;
    [self.customView addSubview:self.threeBtn];
    
    
    //four
    self.fourBtn = [[UIButton alloc]initWithFrame:CGRectMake(KWidthScreen - (KWidthScreen - 84) / 4 * 2, 20, (KWidthScreen - 84)/4, 60)];
    [self.fourBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_button_sessions_normal.png"] forState:UIControlStateNormal];
    self.fourBtn.tag = 4;
    [self.customView addSubview:self.fourBtn];
    
    
    //five
    self.fiveBtn = [[UIButton alloc]initWithFrame:CGRectMake(KWidthScreen - (KWidthScreen - 84) / 4 , 20, (KWidthScreen - 84)/4, 60)];
    [self.fiveBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_button_binders_normal.png"] forState:UIControlStateNormal];
    self.fiveBtn.tag = 5;
    [self.customView addSubview:self.fiveBtn];
    
    
    
    
    [self.oneBtn addTarget:self action:@selector(oneBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.twoBtn addTarget:self action:@selector(twoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeBtn addTarget:self action:@selector(threeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.fourBtn addTarget:self action:@selector(fourBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.fiveBtn addTarget:self action:@selector(fiveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    if (_selectedIndex == -1) {
        self.selectedIndex = 0;
    }
    
    
}

#pragma mark ----切换视图选项
- (void)oneBtnAction:(UIButton *)sender
{
    //当前选中的button  self.selectedIndex会调用set方法，button的tag值-1即为其对应的视图
    self.selectedIndex = sender.tag - 1;
}

- (void)twoBtnAction:(UIButton *)sender
{
    
    self.selectedIndex = sender.tag - 1;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *str = [user objectForKey:@"Nsstring"];
    [[CDChatManager manager]openWithClientId:str callback:^(BOOL succeeded, NSError *error) {
//        ChatListViewController *chat = [[ChatListViewController alloc]init];
        [self.navigationController pushViewController:self.friendVC animated:YES];
    } ];

    
    
}

- (void)threeBtnAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 1;
}

- (void)fourBtnAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 1;
}

- (void)fiveBtnAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 1;
}

#pragma mark ----重写selectedIndex属性的set方法



- (void)setSelectedIndex:(NSInteger)aselectedIndex
{
    //判断新的值与原来的值是否相等，相等则选择的任然是当前视图，不做处理
    if (aselectedIndex == _selectedIndex) {
        return;
    }
    
    //_selectedIndex >=0说明选中了某一按钮
    
    
    if (_selectedIndex >= 0) {
        //需要将前一个视图移除
        //根据_selectedIndex从视图控制器数组中取出先前选中的视图
        UIViewController * previousViewController = [self.viewControllers objectAtIndex:_selectedIndex];
        [previousViewController.view removeFromSuperview];
        
        
        //需要将前一个button的图片改为普通状态的图片
        UIButton * previousButton = (UIButton *)[self.view viewWithTag:_selectedIndex + 1];
        [previousButton setBackgroundImage:[UIImage imageNamed:[self.nomalImageArray objectAtIndex:_selectedIndex]] forState:UIControlStateNormal];
        
    }
    //然后将新的aselectedIndex赋值给_selectedIndex
    _selectedIndex = aselectedIndex;
    //显示新的视图
    UIViewController * currentViewController = [self.viewControllers objectAtIndex:_selectedIndex];
    //找到当前button，将其背景图片改为高亮
    UIButton * currentBtn = [self.view viewWithTag:_selectedIndex+1];
    [currentBtn setBackgroundImage:[UIImage imageNamed:[self.hightlightedImageArray objectAtIndex:_selectedIndex]] forState:UIControlStateNormal];
    
    
    //判断当前视图是否为导航控制器
    if ([currentViewController isKindOfClass:[UINavigationController class]])
        
    {
        //表示这个视图是navgationController
        
        //设置导航的代理
        
        ((UINavigationController *)currentViewController).delegate = self;
        
    }

    
    //设置当前视图的大小
    currentViewController.view.frame = CGRectMake(0, 0, KWidthScreen, KheightScreen-60);
    //添加到tab的view上
    [self.view addSubview:currentViewController.view];
    [self.view sendSubviewToBack:currentViewController.view];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
