//
//  BBUSegmentedViewController.h
//  BBUSegmemtedViewExample
//
//  Created by Boris Bügling on 28/05/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Transition style used when the user changes the selected index by tapping.
 */
typedef NS_ENUM(NSInteger, BBUSegmentedViewTransitionStyle) {
    /**
     *  As seen in UIScrollView
     */
    BBUSegmentedViewTransitionStyleScrolling,
    /**
     *  Slide from left-to-right.
     */
    BBUSegmentedViewTransitionStyleLeftToRight,
    /**
     *  Slide from right-to-left.
     */
    BBUSegmentedViewTransitionStyleRightToLeft,
    /**
     *  Hard switch, no animation.
     */
    BBUSegmentedViewTransitionStyleNone,
};

/**
 *  The segmented view controller provides a simple way of presenting a way to
 *  switch between multiple view controllers using a segmented control.
 *
 *  It simply works by displaying the child view controllers of this view
 *  controller.
 */
@interface BBUSegmentedViewController : UIViewController

/**
 *  Transition style to use when switching between child view controllers.
 */
@property (nonatomic) BBUSegmentedViewTransitionStyle transitionStyle;

@end
