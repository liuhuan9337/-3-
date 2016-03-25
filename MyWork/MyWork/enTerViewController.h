//
//  enTerViewController.h
//  MyWork
//
//  Created by 刘欢 on 16/3/19.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol enTerViewDelegate <NSObject>
- (void)enTerViewDelegateWithNSString:(NSString *)str;
@end
@interface enTerViewController : UIViewController


@property(nonatomic,weak)id<enTerViewDelegate> delegate;

@end
