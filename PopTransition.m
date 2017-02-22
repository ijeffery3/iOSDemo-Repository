//
//  PopTransition.m
//  YunPlayer
//
//  Created by JefferyWan on 2017/2/21.
//  Copyright © 2017年 JefferyWan. All rights reserved.
//

#import "PopTransition.h"

@implementation PopTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return  0.35f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    toVc.view.frame = CGRectOffset(finalFrameForVc, -bounds.size.width, 0);
    
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
