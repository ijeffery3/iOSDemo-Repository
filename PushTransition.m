//
//  PushTransition.m
//  YunPlayer
//
//  Created by JefferyWan on 2017/2/21.
//  Copyright © 2017年 JefferyWan. All rights reserved.
//

#import "PushTransition.h"

@implementation PushTransition

//返回的是动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35f;
}

//动画的具体执行，方法的参数transitionContext遵守了UIViewControllerContextTransitioning协议，所以它包含了许多关于专场所需要的内容，包括转入ViewController和转出Viewcontroller，还有动画容器View--containerView等
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    toVc.view.frame = CGRectOffset(finalFrameForVc, bounds.size.width, 0);
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVc.view.alpha = 1.0;
        toVc.view.frame = finalFrameForVc;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        fromVc.view.alpha = 1.0;
    }];
    
}

@end
