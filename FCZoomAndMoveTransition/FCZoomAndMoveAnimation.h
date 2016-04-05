//
//  FCZoomAndMoveAnimation.h
//
//
//  Created by Frank on 12/11/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCZoomAndMoveAnimation : NSObject

/**
 *  放大动画
 *
 *  @param view      要改变的view
 *  @param superview 父视图
 *  @param rate      变大比率
 *  @param duration  动画时间
 *  @param delay     延迟时间
 */
+ (void)zoomInAnimationWithView:(UIView *)view inSuperview:(UIView *)superview withRate:(CGFloat)rate duration:(CGFloat)duration delay:(CGFloat)delay;

@end
