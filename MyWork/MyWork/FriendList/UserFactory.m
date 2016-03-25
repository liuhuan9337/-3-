//
//  UserFactory.m
//  MyWork
//
//  Created by 刘欢 on 16/3/25.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "UserFactory.h"
#import <LeanChatLib/LeanChatLib.h>

@interface CDUser : NSObject <CDUserModelDelegate>

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) NSString *username;

@property (nonatomic, strong) NSString *avatarUrl;

@end
@implementation CDUser

@end
@implementation UserFactory
- (void)cacheUserByIds:(NSSet *)userIds block:    (AVBooleanResultBlock)block {
    block(YES, nil);
}

- (id <CDUserModelDelegate> )getUserById:(NSString *)userId {
    CDUser *user = [[CDUser alloc] init];
    user.userId = userId;
    //在cell中显示的聊天对象的名字
    user.username = userId;
    //聊天对象的头像
    user.avatarUrl = @"http://tp2.sinaimg.cn/5088940253/180/5745995456/1";
    return user;
}

@end
