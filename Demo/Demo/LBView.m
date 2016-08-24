//
//  LBView.m
//  Demo
//
//  Created by 战场原黑仪 on 16/8/24.
//  Copyright © 2016年 战场原黑仪. All rights reserved.
//

#import "LBView.h"
#import "UIView+LBShoppingCart.h"

@implementation LBView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self animationWithStartView:1.5 endPoint:CGPointMake(180, 667) completed:^{
        NSLog(@"丢丢丢");
    }];
    
}


@end
