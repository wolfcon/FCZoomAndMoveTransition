//
//  FCZoomAndMoveTransitioning.m
//  
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import "FCZoomAndMoveTransitioning.h"

CGFloat const ZoomAndMoveTransitionDuration = 0.5;

@interface FCZoomAndMoveTransitioning ()

@end

@implementation FCZoomAndMoveTransitioning

+ (instancetype)transitioningWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 {
    return [[self alloc] initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2];
}

+ (instancetype)transitioningWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration {
    return [[self alloc] initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2 duration:duration];
}

- (instancetype)initWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 {
    return [self initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2 duration:0];
}

- (instancetype)initWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration {
    self = [super init];
    if (self) {
        _snapshotView = snapshot;
        _convertFrameFromView1 = view1;
        _relatedView = relatedView;
        _convertFrameFromView2 = view2;
        _duration = duration;
    }
    return self;
}

#pragma mark - <<< --- UIViewControllerAnimatedTransitioning --- >>> -

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _duration == 0 ? ZoomAndMoveTransitionDuration : _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 获取控制器和视图
    //    UIViewController *const fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *const toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *const containerView = [transitionContext containerView];
    
    // 创建一个 view, 并把 view 隐藏, 迫使用户以为移动的就是 view.
    UIView *const snapshot = [_snapshotView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = [containerView convertRect:_snapshotView.frame fromView:_convertFrameFromView1];
    _snapshotView.hidden = YES;
    
    // 设置目标控制器的位置, 并把透明度设为0, 在后面的动画中慢慢显示出来变为1
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    
    // 都添加到 container 中.
    [containerView addSubview:toViewController.view];
    [containerView addSubview:snapshot];
    
    CGRect targetFrame = [containerView convertRect:_relatedView.frame fromView:_convertFrameFromView2];
    
    // 执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         snapshot.frame = targetFrame;
                         toViewController.view.alpha = 1;
                     } completion:^(BOOL finished) {
                         _snapshotView.hidden = NO;
                         [snapshot removeFromSuperview];
                         
                         // 动画完成后必须执行此方法, 交出控制权
                         [transitionContext completeTransition:YES];
                     }];
}

@end
