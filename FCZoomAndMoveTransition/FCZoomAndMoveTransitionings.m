//
//  FCZoomAndMoveTransitionings.m
// 
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import "FCZoomAndMoveTransitionings.h"

@implementation FCZoomAndMoveTransitionings

+ (instancetype)transitioningsWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 {
    return [[self alloc] initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2];
}

+ (instancetype)transitioningsWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration {
    return [[self alloc] initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2 duration:duration];
}

- (instancetype)initWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 {
    return [self initWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2 duration:0];
}

- (instancetype)initWithSnapshotView:(UIView *)snapshot convertFrameFromView:(UIView *)view1 toViewControllerSnapshotRelatedView:(UIView *)relatedView convertFrameFromView:(UIView *)view2 duration:(CGFloat)duration{
    self = [super init];
    if (self) {
        _presentTransitioning = [FCZoomAndMoveTransitioning transitioningWithSnapshotView:snapshot convertFrameFromView:view1 toViewControllerSnapshotRelatedView:relatedView convertFrameFromView:view2 duration:duration];
        
        _dismissTransitioning = [FCZoomAndMoveTransitioning transitioningWithSnapshotView:relatedView convertFrameFromView:view2 toViewControllerSnapshotRelatedView:snapshot convertFrameFromView:view1 duration:duration];
        
        _pushTransitioning = _presentTransitioning;
        _popTransitioning = _dismissTransitioning;
    }
    return self;
}

@end
