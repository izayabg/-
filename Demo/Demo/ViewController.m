//
//  ViewController.m
//  Demo
//
//  Created by 战场原黑仪 on 16/8/24.
//  Copyright © 2016年 战场原黑仪. All rights reserved.
//

#import "ViewController.h"
#import "LBView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    LBView *view1 = [[LBView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    view1.backgroundColor = [UIColor brownColor];
    
    LBView *view2 = [[LBView alloc]initWithFrame:CGRectMake(25, 25, 50, 50)];
    view2.backgroundColor = [UIColor grayColor];
    
    [view1 addSubview:view2];
    [self.view addSubview:view1];
    
}

@end
