//
//  ViewController.m
//  UIPickerViewDemo
//
//  Created by hengyi zhang on 15/7/30.
//  Copyright (c) 2015年 com.zhy. All rights reserved.
//

#import "ViewController.h"
#import "DPMDatePickerView.h"
#define APPH self.view.frame.size.height
#define APPW self.view.frame.size.width

@interface ViewController ()

@property (nonatomic, strong) DPMDatePickerView *datePickerView;

@property (nonatomic, strong) UILabel *dateLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 100, 100, 40)];
    selectBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    selectBtn.layer.borderColor = [UIColor grayColor].CGColor;
    selectBtn.layer.borderWidth = 0.5;
    [selectBtn setTitle:@"选择日期" forState:UIControlStateNormal];
    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    
    self.dateLabel= [[UILabel alloc] initWithFrame:CGRectMake(40, 140 + 20, 200, 40)];
    self.dateLabel.font = [UIFont systemFontOfSize:14.0];
    self.dateLabel.textColor = [UIColor blueColor];
    [self.view addSubview:self.dateLabel];
}
- (void)selectBtnAction {
    self.datePickerView.hidden = NO;
}

- (void)printDate:(NSString *)dateStr
{
    NSLog(@"你选择的日期是:%@", dateStr);
    NSString *formateStr = [dateStr stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    self.dateLabel.text = [NSString stringWithFormat:@"你选择的日期是:%@", formateStr];
}

#pragma mark - setMethods
- (DPMDatePickerView *)datePickerView
{
    if (!_datePickerView) {
        _datePickerView = [[DPMDatePickerView alloc] initWithFrame:CGRectMake(0, APPH - 260, APPW, 260)];
        __weak typeof(self) weakSelf = self;
        __block NSInteger count = 0;
        _datePickerView.cancelBlock = ^{
            typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.datePickerView.hidden = YES;
            count = 3;
        };
        _datePickerView.okBlock = ^(NSString *dateStr) {
            typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.datePickerView.hidden = YES;
            [strongSelf printDate:dateStr];
        };
        [self.view addSubview:_datePickerView];
    }
    [self.view bringSubviewToFront:_datePickerView];
    return _datePickerView;
}

@end
