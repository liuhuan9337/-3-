//
//  Rootview.m
//  MyWork
//
//  Created by 刘欢 on 16/3/24.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "Rootview.h"

@implementation Rootview


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
    CGFloat height = self.frame.size.height;
    CGFloat weight = self.frame.size.width;
    self.textfield = [[UITextView alloc]initWithFrame:CGRectMake(0, 20, weight, height - 50)];
    self.textfield.editable = YES;
    
    [self addSubview:self.textfield];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, CGRectGetMaxY(self.textfield.frame), weight/2, 50);
    self.button.backgroundColor = [UIColor greenColor];
    
    [self addSubview:self.button];
    self.buttonFirst = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonFirst.frame = CGRectMake(CGRectGetMaxX(self.button.frame), self.button.frame.origin.y, CGRectGetWidth(self.button.frame), CGRectGetHeight(self.button.frame));
    self.buttonFirst.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.buttonFirst];
}
@end
