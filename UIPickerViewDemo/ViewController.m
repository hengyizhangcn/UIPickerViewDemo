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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 40)];
    addBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [addBtn setTitle:@"选择日期" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}
- (void)addBtnAction {
    self.datePickerView.hidden = NO;
}

- (void)printDate:(NSString *)dateStr
{
    NSLog(@"你选择的日期是:%@", dateStr);
}

#pragma mark - setMethods
- (DPMDatePickerView *)datePickerView
{
    if (!_datePickerView) {
        _datePickerView = [[DPMDatePickerView alloc] initWithFrame:CGRectMake(0, APPH - 260, APPW, 260)];
        __weak typeof(self) weakSelf = self;
        _datePickerView.cancelBlock = ^{
            typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.datePickerView.hidden = YES;
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
