//
//  ChatListViewController.m
//  MyWork
//
//  Created by 刘欢 on 16/3/25.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "ChatListViewController.h"
#import "ChatROOMViewController.h"
#import <CDChatManager.h>
@interface ChatListViewController ()<CDChatListVCDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UIView *headerView;
@end

@implementation ChatListViewController
- (void)viewController:(UIViewController *)viewController didSelectConv:(AVIMConversation *)conv
{
    ChatROOMViewController * chatRoom = [[ChatROOMViewController alloc]initWithConversation:conv];
    [self.navigationController pushViewController:chatRoom animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;

    self.chatListDelegate = self;
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 30, 260)];
    self.headerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = self.headerView;
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(15, 5, self.view.bounds.size.width - 30, 125)];
    _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textField.layer.borderWidth = 1;
    [self.headerView addSubview:_textField];
    
    UIButton * startChat = [UIButton buttonWithType:UIButtonTypeSystem];
    startChat.frame = CGRectMake(60, 35, self.view.bounds.size.width - 120, 20);
    [startChat setTitle:@"开始聊天" forState:UIControlStateNormal];
    [self.headerView addSubview:startChat];
    [startChat addTarget:self action:@selector(startChatClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)startChatClicked:(UIButton *)btn
{
    if(_textField.text.length > 0)
    {
        //        [[CDChatManager manager] fetchConvWithOtherId:_textField.text callback:^(AVIMConversation *conversation, NSError *error) {
        //            ChatRoomViewController * chatRoom = [[ChatRoomViewController alloc]initWithConv:conversation];
        //            [self.navigationController pushViewController:chatRoom animated:YES];
        //        }];
        [[CDChatManager manager]fetchConversationWithOtherId:_textField.text callback:^(AVIMConversation *conversation, NSError *error) {
            ChatROOMViewController *chatRoom = [[ChatROOMViewController alloc]initWithConversation:conversation];
            [self.navigationController pushViewController:chatRoom animated:YES];
        }];
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    return cell;
//}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.tabBarController.tabBar.hidden = YES;
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
