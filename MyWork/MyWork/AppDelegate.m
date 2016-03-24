//
//  AppDelegate.m
//  MyWork
//
//  Created by Sea on 16/3/14.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "AppDelegate.h"
#import "enTerViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     leanCloud的key值和ID类型
     
     */
    [AVOSCloud setApplicationId:@"y2hn1uNSyG2oFuh1O6KDWKvt-gzGzoHsz"
                      clientKey:@"uS135tVAxwaQjmRJwz3QXHgd"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
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
    FriendListTableViewController * friendVC = [[FriendListTableViewController alloc]init];
    friendVC.navigationItem.title = @"好友列表";
    friendVC.view.backgroundColor = [UIColor purpleColor];
    UINavigationController * friendNC = [[UINavigationController alloc]initWithRootViewController:friendVC];
    
    //发现列表
    FindTableViewController * findVC = [[FindTableViewController alloc]init];
    findVC.navigationItem.title = @"发现";
    findVC.view.backgroundColor = [UIColor grayColor];
    UINavigationController * findNC = [[UINavigationController alloc]initWithRootViewController:findVC];
    
    
    
    CustomTabBarVC * tabBarTV = [[CustomTabBarVC alloc]init];
    tabBarTV.viewControllers = [NSArray arrayWithObjects:myNC,friendNC,issueNC,selectNC,findNC, nil];
    /**
     *  登录界面
     */
    enTerViewController *enter = [enTerViewController new];
    UINavigationController *NaVC = [[UINavigationController alloc]initWithRootViewController:enter];
    NSUserDefaults *ster = [NSUserDefaults standardUserDefaults];
    if ([ster boolForKey:@"Enter"] == NO) {
        self.window.rootViewController = NaVC;
    }else{
        self.window.rootViewController = tabBarTV;
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
