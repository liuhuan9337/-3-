//
//  DetailViewController.h
//  WhereAreYou
//
//  Created by lanou3g on 16/3/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstModel;
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Biaoti;
@property (weak, nonatomic) IBOutlet UILabel *xiaoqu;
@property (weak, nonatomic) IBOutlet UILabel *didian;

@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UILabel *Naem;
@property (weak, nonatomic) IBOutlet UILabel *aPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *QQ;
@property (weak, nonatomic) IBOutlet UILabel *leixing;
@property (weak, nonatomic) IBOutlet UILabel *genduo;
@property(nonatomic,strong)FirstModel *model;


@end
