//
//  SelectPickerNewView.m
//  MyWork
//
//  Created by lanou3g on 16/3/24.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "SelectPickerNewView.h"

@implementation SelectPickerNewView

+ (instancetype)initPickerView{
    SelectPickerNewView *pickerView = [[[NSBundle mainBundle] loadNibNamed:@"SelectPickerView" owner:nil options:nil] lastObject];
    return pickerView;
}

-(void)awakeFromNib{
    self.shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, -400, self.bounds.size.width, self.bounds.size.height)];
    self.shadowView.backgroundColor = [UIColor blackColor];
    self.shadowView.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0.5;
    }];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, self.bounds.size.width, 200)];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self addSubview:self.pickerView];
}

- (IBAction)ButtonAction:(id)sender {
    [self removeFromSuperview];
    [self.shadowView removeFromSuperview];
    
}
- (IBAction)ButtonNew:(id)sender {
    [self.delegate getString:self.selectString];
    [self removeFromSuperview];
    [self.shadowView removeFromSuperview];
    
    
}

#pragma mark ----- pickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _array.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    self.selectString = [_array objectAtIndex:row];
    return [_array objectAtIndex:row];
}

@end
