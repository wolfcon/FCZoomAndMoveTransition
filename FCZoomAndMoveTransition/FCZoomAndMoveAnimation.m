//
//  FCZoomAndMoveAnimation.m
//
//
//  Created by Frank on 12/11/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import "FCZoomAndMoveAnimation.h"

@implementation FCZoomAndMoveAnimation

+ (void)zoomInAnimationWithView:(UIView *)view inSuperview:(UIView *)superview withRate:(CGFloat)rate duration:(CGFloat)duration delay:(CGFloat)delay {
    // 创建动画用的snapshot
    UIView *snapshot = [view snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = view.frame;
    // 计算放大尺寸
    CGRect zoomedInFrame = snapshot.frame;
    zoomedInFrame.origin.x -= zoomedInFrame.size.width * (rate - 1) / 2;
    zoomedInFrame.origin.y -= zoomedInFrame.size.height * (rate - 1) / 2;
    
    zoomedInFrame.size.width *= rate;
    zoomedInFrame.size.height *= rate;
    // 添加snapshot
    [superview addSubview:snapshot];
    
    view.hidden = YES;
    // 执行动画
	[UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         snapshot.frame = zoomedInFrame;
                     }
                     completion:^(BOOL finished) {
                         // 删除snapshot
                         [snapshot removeFromSuperview];
                         view.hidden = NO;
                     }];
}
@end
