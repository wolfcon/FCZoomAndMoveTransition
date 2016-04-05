//
//  FCZoomAndMoveTransitionings.h
//
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCZoomAndMoveTransitioning.h"

@interface FCZoomAndMoveTransitionings : NSObject

@property (nonatomic, strong) FCZoomAndMoveTransitioning *presentTransitioning;

@property (nonatomic, strong) FCZoomAndMoveTransitioning *dismissTransitioning;

@property (nonatomic, strong) FCZoomAndMoveTransitioning *pushTransitioning;

@property (nonatomic, strong) FCZoomAndMoveTransitioning *popTransitioning;

/**
 *  创建一个实例
 *
 *  @param snapshot 要快照的View
 *  @param view1     要转换快照的坐标View
 *  @param relatedView  快照移动到对应的目标View
 *  @param view2    对应的目标View要转换的坐标View
 *
 *  @return 动画Transitioning集合实例(共有present和dismiss2个Transitioning实例, 可直接赋值给Delegate使用)
 */
+ (instancetype)transitioningsWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2;

/**
 *  创建一个实例
 *
 *  @param snapshot 要快照的View
 *  @param view1     要转换快照的坐标View
 *  @param relatedView  快照移动到对应的目标View
 *  @param view2    对应的目标View要转换的坐标View
 *  @param duration    动画持续时间
 *
 *  @return 动画Transitioning集合实例(共有present和dismiss2个Transitioning实例, 可直接赋值给Delegate使用)
 */
+ (instancetype)transitioningsWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration;

@end
