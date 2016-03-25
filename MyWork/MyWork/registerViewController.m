//
//  registerViewController.m
//  MyWork
//
//  Created by 刘欢 on 16/3/19.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "registerViewController.h"

@interface registerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passname;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *passEmail;

@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.passWord.secureTextEntry = YES;
}
- (IBAction)passWordAction:(id)sender {
    AVUser *user = [AVUser user];
    user.username = self.passname.text;
    user.password = self.passWord.text;
    user.email = self.passEmail.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        
        
        if (succeeded) {
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{

            NSString * strErr = nil;
            if (error.code == 202) {
                strErr = @"账户已经存在";
            }else if (error.code == 125){
                strErr = @"邮箱格式错误";
            }else if (error.code == 217){
                strErr = @"用户名不能为空";
            }else if (error.code == 218){
                strErr = @"密码不能为空";
            }
            
            UIAlertController * alertDone = [UIAlertController alertControllerWithTitle:@"提示" message:strErr preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * alertture = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            
            [alertDone addAction:alertture];
            
            [self showViewController:alertDone sender:nil];
            
//            NSLog(@"%@",error.userInfo);
            
}
    }];
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
