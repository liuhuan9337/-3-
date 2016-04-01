//
//  LendCloudModel.m
//  MyWork
//
//  Created by 刘欢 on 16/3/31.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "LendCloudModel.h"
#import "FirstModel.h"
@implementation LendCloudModel
+(instancetype)shareLendCloudModel
{
    static LendCloudModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[LendCloudModel alloc]init];
    });
    return model;
}
+(void)dataWithLendCloudOnblack:(Bloack)black
{
    NSMutableArray *array = [NSMutableArray array];
    AVQuery *query = [AVQuery queryWithClassName:@"Boy"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count == 0) {
            
        }else{
            NSDictionary *diction = [NSDictionary dictionary];
            diction = objects[0];
            NSArray *arr = diction[@"testArray"];
            for (NSDictionary *dic in arr) {
                FirstModel *model = [[FirstModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [array addObject:model];
            }
            black(array);
        }
    }];
}
@end
