//
//  DPMDatePickView.m
//  UIPickerViewDemo
//
//  Created by hengyi zhang on 15/7/30.
//  Copyright (c) 2015年 com.zhy. All rights reserved.
//

#import "DPMdatePickerView.h"
#define APPH self.frame.size.height
#define APPW self.frame.size.width

@interface DPMDatePickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *datePickerView;

@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *okButton;

@end

@implementation DPMDatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addDatePicker];
    }
    return self;
}

- (void)addDatePicker {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPW, 0.5)];
    line.backgroundColor = [UIColor grayColor];
    line.alpha = 0.5;
    [self addSubview:line];
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    self.cancelButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelButton];
    
    self.okButton = [[UIButton alloc] initWithFrame:CGRectMake(APPW - 50, 0, 50, 40)];
    self.okButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.okButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.okButton addTarget:self action:@selector(okBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.okButton];
    
    self.datePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, APPW, APPH - 40)];
    self.datePickerView.delegate = self;
    self.datePickerView.dataSource = self;
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dd = [cal components:unitFlags fromDate:now];
    NSInteger year = [dd year];
    NSInteger month = [dd month];
    NSInteger day = [dd day];
    [self.datePickerView selectRow:(year - 1900) inComponent:0 animated:NO];
    [self.datePickerView selectRow:(month - 1) inComponent:1 animated:NO];
    [self.datePickerView selectRow:(day - 1) inComponent:2 animated:NO];
    [self addSubview:self.datePickerView];
}

- (void)cancelBtnAction {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (void)okBtnAction {
    NSString *year = [self pickerView:self.datePickerView titleForRow:[self.datePickerView selectedRowInComponent:0] forComponent:0];
    NSString *month = [self pickerView:self.datePickerView titleForRow:[self.datePickerView selectedRowInComponent:1] forComponent:1];
    NSString *day = [self pickerView:self.datePickerView titleForRow:[self.datePickerView selectedRowInComponent:2] forComponent:2];
    
    if (self.okBlock) {
        self.okBlock([NSString stringWithFormat:@"%@-%@-%@", year, month, day]);
    }
}

#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger yearSelected;
    NSInteger monthSelected;
    switch (component) {
        case 0:
            return 200;
            break;
        case 1:
            return 12;
        case 2:
            yearSelected = [pickerView selectedRowInComponent:0] + 1900;
            monthSelected = [pickerView selectedRowInComponent:1] + 1;
            if (monthSelected == 2 && (yearSelected % 4 == 0) && (yearSelected % 100 != 0)) {
                return 29;
            } else if (monthSelected == 2) {
                return 28;
            } else if (monthSelected == 1 || monthSelected == 3 || monthSelected == 5 || monthSelected == 7 || monthSelected == 8 || monthSelected == 10 || monthSelected == 12) {
                return 31;
            } else {
                return 30;
            }
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [NSString stringWithFormat:@"%ld", row + 1900];
            break;
        case 1:
            return [NSString stringWithFormat:@"%ld", row + 1];
        case 2:
            return [NSString stringWithFormat:@"%ld", row + 1];
        default:
            return @"";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            break;
        case 1:
            [pickerView reloadComponent:2];
            
        default:
            break;
    }
}
@end
