//
//  NumberThreeViewController.h
//  MyWork
//
//  Created by 刘欢 on 16/3/24.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ThreeViewControllerDelegate <NSObject>
- (void)threeWithNsstring:(NSString *)str;
@end
@interface NumberThreeViewController : UIViewController

@property(nonatomic,weak)id<ThreeViewControllerDelegate> delegate;

@end
