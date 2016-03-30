//
//  HeaderView.m
//  MyWork
//
//  Created by Sea on 16/3/30.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "HeaderView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}

- (void)allViews
{
    self.backgroundColor = [UIColor greenColor];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 120)/2.0, 20, 120, 120)];
    self.imageView.backgroundColor = [UIColor purpleColor];
    self.imageView.layer.cornerRadius = 60;
    [self addSubview:self.imageView];
    
    self.nameID = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - 200)/2.0, CGRectGetMaxY(self.imageView.frame)+5, 200, 50)];
    self.nameID.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.nameID];
    
}

@end
