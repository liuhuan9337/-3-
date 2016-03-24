//
//  SelectPickerView.m
//  MyWork
//
//  Created by zhangguobiao on 16/3/18.
//  Copyright © 2016年 Sea. All rights reserved.
//

#import "SelectPickerView.h"

@implementation SelectPickerView

+ (instancetype)initPickerView{
    SelectPickerView *pickerView = [[[NSBundle mainBundle] loadNibNamed:@"SelectPickerView" owner:nil options:nil] lastObject];
    return pickerView;
}

-(void)awakeFromNib{
    self.shadowView = [UIView new];
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
    
//    _array1 = @[@"寻物启事",@"招领启事"];
//    _array2 = @[@"校园卡",@"手机",@"衣服",@"书籍"];
    
}
- (IBAction)cancleAction:(id)sender {
    [self removeFromSuperview];
    [self.shadowView removeFromSuperview];
}
- (IBAction)sureAction:(id)sender {
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
