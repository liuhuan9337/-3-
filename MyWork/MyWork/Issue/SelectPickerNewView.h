//
//  SelectPickerNewView.h
//  MyWork
//
//  Created by lanou3g on 16/3/24.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectPickerViewDelegate <NSObject>

- (void)getString:(NSString *)selectString;

@end

@interface SelectPickerNewView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIView       *shadowView;// 阴影
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSString *selectString;

@property (nonatomic, assign) id<SelectPickerViewDelegate> delegate;

+ (instancetype)initPickerView;
@end
