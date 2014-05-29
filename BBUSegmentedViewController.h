//
//  BBUSegmentedViewController.h
//  BBUSegmemtedViewExample
//
//  Created by Boris Bügling on 28/05/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BBUSegmentedViewTransitionStyle) {
    BBUSegmentedViewTransitionStyleScrolling,
    BBUSegmentedViewTransitionStyleLeftToRight,
    BBUSegmentedViewTransitionStyleRightToLeft,
    BBUSegmentedViewTransitionStyleNone,
};

@interface BBUSegmentedViewController : UIViewController

@property (nonatomic) BBUSegmentedViewTransitionStyle transitionStyle;

@end
