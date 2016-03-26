//
//  AppDelegate.h
//  MyWork
//
//  Created by Sea on 16/3/14.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//被管理对象上下文
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//app中的实体类
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//关联实体数据库的通道
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//对真实数据库进行修改
- (void)saveContext;
//真实数据库存放的位置
- (NSURL *)applicationDocumentsDirectory;



@end

