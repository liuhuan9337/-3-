//
//  FirstTableViewCell.m
//  WhereAreYou
//
//  Created by lanou3g on 16/3/14.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       self = [FirstTableViewCell makeCell];
        //设置圆角
        self.lb.layer.cornerRadius = self.lb.bounds.size.width/2;
        self.lb.layer.masksToBounds = YES;
        
    }
    return self;
}



+ (instancetype)makeCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"FirstTableViewCell" owner:self options:nil] lastObject];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
