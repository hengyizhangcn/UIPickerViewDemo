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

@interface ViewController () <DPMDatePickerViewDelegate> {
    DPMDatePickerView *datePickerView;
}

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
    datePickerView = [[DPMDatePickerView alloc] initWithFrame:CGRectMake(0, APPH - 260, APPW, 260)];
    datePickerView.delegate = self;
    
}
- (void)addBtnAction {
    [self.view addSubview:datePickerView];
}

#pragma mark DPMDatePickerViewDelegate

- (void)datePickerViewCancelAction {
    [datePickerView removeFromSuperview];
}
- (void)datePickerViewOk:(NSString *)dateStr {
    [datePickerView removeFromSuperview];
    NSLog(@"%@", dateStr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
