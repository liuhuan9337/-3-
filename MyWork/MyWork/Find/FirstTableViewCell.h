//
//  FirstTableViewCell.h
//  WhereAreYou
//
//  Created by lanou3g on 16/3/14.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lb;



+ (instancetype)makeCell;

@end
