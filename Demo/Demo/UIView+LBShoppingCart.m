//
//  UIView+LBShoppingCart.m
//  LoveFreshBee
//
//  Created by 战场原黑仪 on 16/8/21.
//  Copyright © 2016年 战场原黑仪. All rights reserved.
//

#import "UIView+LBShoppingCart.h"

@implementation UIView (LBShoppingCart)

- (void)animationWithStartView:(NSTimeInterval)duration endPoint:(CGPoint)endPoint completed:(CompletedBlock)completed {
    //复制视图
    UIView *view = [self copyimageView];
    
//    self.backgroundColor = [UIColor greenColor];
    //开始动画的坐标,从该视图的中心点开始
    CGFloat startX = view.center.x;
    CGFloat startY = view.center.y;
    CGPoint startP = CGPointMake(startX, startY);
    
    //计算和终点的差值
    CGFloat rangeX = (endPoint.x - startX);
    CGFloat rangeY = view.bounds.size.height;
    
    //中心点坐标
    CGFloat centerX = startX - (endPoint.x - startX)/2 + rangeX;
    CGFloat centerY = startY - (endPoint.y - startY)/2 - rangeY;
    CGPoint centerP = CGPointMake(centerX, centerY);
    
    //路径绘制
    UIBezierPath *bezier = [[UIBezierPath alloc] init];
    [bezier moveToPoint:startP];
    //二元路径
    [bezier addQuadCurveToPoint:endPoint controlPoint:centerP];
    
    //抛物线动画, 用帧动画处理
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = [bezier CGPath];
    // 设置保存动画的最新状态
    anim.fillMode = kCAFillModeForwards;
    // 设置动画执行完毕之后不删除动画
    anim.removedOnCompletion = NO;
    
    anim.duration = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [view.layer addAnimation:anim forKey:@"ParabolaAnimation"];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [view.layer addAnimation:anim forKey:@"ParabolaAnimation"];
//
//    });
    
    //缩小动画
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformMakeRotation(M_PI);
        view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        completed();
    }];
    
}


//复制一份视图
- (UIView *)copyView {
    //从项目中解档
    UIView *view = [NSKeyedUnarchiver unarchiveObjectWithData:([NSKeyedArchiver archivedDataWithRootObject:self])];
    
    //添加到父控件中
//    [self.superview addSubview:view];
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    return view;
}

//视图截图
- (UIImageView *)copyimageView {
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    //将当前视图渲染到上下文中
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //获取当前视图的截图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //创建视图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[self convertRect:self.bounds toView:nil]];
    imageView.image = image;
    
    [[UIApplication sharedApplication].keyWindow addSubview:imageView];
    
    return imageView;
}

@end
