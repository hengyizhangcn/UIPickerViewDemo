//
//  DPMDatePickerView.h
//  UIPickerViewDemo
//
//  Created by hengyi zhang on 15/7/30.
//  Copyright (c) 2015年 com.zhy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DPMDatePickerViewDelegate;

@interface DPMDatePickerView : UIView <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *_datepickerView;
}
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, assign) id<DPMDatePickerViewDelegate> delegate;
@end

@protocol  DPMDatePickerViewDelegate<NSObject>

- (void)datePickerViewCancelAction;
- (void)datePickerViewOk:(NSString *)dateStr;

@end