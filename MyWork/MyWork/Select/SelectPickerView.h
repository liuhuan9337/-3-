//
//  SelectPickerView.h
//  MyWork
//
//  Created by zhangguobiao on 16/3/18.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectPickerViewDelegate <NSObject>

- (void)getString:(NSString *)selectString;

@end

@interface SelectPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIView       *shadowView;// 阴影
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSString *selectString;

@property (nonatomic, assign) id<SelectPickerViewDelegate> delegate;

+ (instancetype)initPickerView;

@end
