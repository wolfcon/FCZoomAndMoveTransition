//
//  FCZoomAndMoveTransitioningDelegate.h
//
//
//  Created by Frank on 12/4/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCZoomAndMoveTransitionings.h"

@interface FCZoomAndMoveTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) FCZoomAndMoveTransitionings *transitionings;

+ (instancetype)transitioningDelegateWithPresentTransitioning:(FCZoomAndMoveTransitioning *)presentTransitioning dismissTransitioning:(FCZoomAndMoveTransitioning *)dismissTransitioning;

+ (instancetype)transitioningDelegateWithTransitionings:(FCZoomAndMoveTransitionings *)transitionings;

@end
