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
            NSLog(@"注册成功");
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            /**
             *  提示框
             */
#warning 提示框
            NSLog(@"注册不成功");
            NSLog(@"%@",error);
            
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
