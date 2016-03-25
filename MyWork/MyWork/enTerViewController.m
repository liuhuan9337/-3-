//
//  enTerViewController.m
//  MyWork
//
//  Created by 刘欢 on 16/3/19.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "enTerViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "CustomTabBarVC.h"
#import "registerViewController.h"

@interface enTerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passname;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation enTerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.password.secureTextEntry = YES;
}

/**
 *  登录
 */
- (IBAction)enterAction:(id)sender {
    [AVUser logInWithUsernameInBackground:self.passname.text password:self.password.text block:^(AVUser *user, NSError *error) {
        if (user != nil ) {
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setBool:YES forKey:@"Enter"];
            [self.delegate enTerViewDelegateWithNSString:self.passname.text];
            [user setObject:self.passname.text forKey:@"Nsstring"];
            [self presentViewController:[CustomTabBarVC new] animated:YES completion:nil];
            
        }else{
#pragma mark 提示框
            
//            NSLog(@"%@",error.userInfo);
            NSString * errMessage = nil;
            if (error.code == 211) {
                errMessage = @"用户名不存在";
            }if (error.code == 210) {
                errMessage = @"用户名或密码不对";
            }
            UIAlertController * alertLogin = [UIAlertController alertControllerWithTitle:@"提示" message:errMessage preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction * cancle = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertLogin addAction:cancle];
            [self showDetailViewController:alertLogin sender:nil];
            
        }
    }];
    
}
/**
 *  注册
 */
- (IBAction)registerAction:(id)sender {
    
    [self presentViewController:[registerViewController new] animated:YES completion:nil];
    
    
    
    
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
