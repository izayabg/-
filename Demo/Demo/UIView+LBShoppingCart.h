//
//  UIView+LBShoppingCart.h
//  LoveFreshBee
//
//  Created by 战场原黑仪 on 16/8/21.
//  Copyright © 2016年 战场原黑仪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletedBlock)(void);

@interface UIView (LBShoppingCart)

- (void)animationWithStartView:(NSTimeInterval)duration endPoint:(CGPoint)endPoint completed:(CompletedBlock)completed;

@end
