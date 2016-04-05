//
//  FCZoomAndMoveTransitioningDelegate.m
//  
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import "FCZoomAndMoveTransitioningDelegate.h"

@interface FCZoomAndMoveTransitioningDelegate ()

@end

@implementation FCZoomAndMoveTransitioningDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transitionings = [FCZoomAndMoveTransitionings new];
    }
    return self;
}

#pragma mark - <<< --- UIViewControllerTransitioningDelegate initialization --- >>> -
+ (instancetype)transitioningDelegateWithPresentTransitioning:(FCZoomAndMoveTransitioning *)presentTransitioning dismissTransitioning:(FCZoomAndMoveTransitioning *)dismissTransitioning {
    return [[self alloc] initWithPresentTransitioning:presentTransitioning dismissTransitioning:dismissTransitioning];
}

+ (instancetype)transitioningDelegateWithTransitionings:(FCZoomAndMoveTransitionings *)transitionings {
    return [self transitioningDelegateWithPresentTransitioning:transitionings.presentTransitioning dismissTransitioning:transitionings.dismissTransitioning];
}

- (instancetype)initWithPresentTransitioning:(FCZoomAndMoveTransitioning *)presentTransitioning dismissTransitioning:(FCZoomAndMoveTransitioning *)dismissTransitioning {
    self = [super init];
    if (self) {
        _transitionings.presentTransitioning = presentTransitioning;
        _transitionings.dismissTransitioning = dismissTransitioning;
    }
    return self;
}

#pragma mark - <<< --- UIViewControllerTransitioningDelegate --- >>> -

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _transitionings.presentTransitioning;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _transitionings.dismissTransitioning;
}

@end
