//
//  LendCloudModel.h
//  MyWork
//
//  Created by 刘欢 on 16/3/31.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Bloack)(id object);
@interface LendCloudModel : NSObject
+(instancetype)shareLendCloudModel;
+(void)dataWithLendCloudOnblack:(Bloack)black;
@end
