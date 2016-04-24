//
//  DPMDatePickerView.h
//  UIPickerViewDemo
//
//  Created by hengyi zhang on 15/7/30.
//  Copyright (c) 2015年 com.zhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPMDatePickerView : UIView
/**
 *  取消
 */
@property (nonatomic, copy) void(^cancelBlock)();
/**
 *  确定block，回传日期字符串，格式：年-月-日
 */
@property (nonatomic, copy) void(^okBlock)(NSString *dateStr);
@end