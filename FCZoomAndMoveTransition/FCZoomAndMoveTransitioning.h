//
//  FCZoomAndMoveTransitioning.h
//  
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCZoomAndMoveTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIView *snapshotView;

@property (nonatomic, strong) UIView *convertFrameFromView1;

@property (nonatomic, strong) UIView *relatedView;

@property (nonatomic, strong) UIView *convertFrameFromView2;

@property (nonatomic, assign) CGFloat duration;

/**
 *  创建一个实例
 *
 *  @param snapshot 要快照的View
 *  @param view1     要转换快照的坐标View
 *  @param relatedView  快照移动到对应的目标View
 *  @param view2    对应的目标View要转换的坐标View
 *
 *  @return 动画实例
 */
+ (instancetype)transitioningWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2;

/**
 *  创建一个实例
 *
 *  @param snapshot 要快照的View
 *  @param view1     要转换快照的坐标View
 *  @param relatedView  快照移动到对应的目标View
 *  @param view2    对应的目标View要转换的坐标View
 *  @param duration     动画持续时间
 *
 *  @return 动画实例
 */
+ (instancetype)transitioningWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration;

@end
