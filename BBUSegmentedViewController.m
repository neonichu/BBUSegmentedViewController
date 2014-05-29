//
//  BBUSegmentedViewController.m
//  BBUSegmemtedViewExample
//
//  Created by Boris Bügling on 28/05/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUSegmentedViewController.h"
#import "UIView+Geometry.h"

static const CGFloat defaultMargin = 20.0;

@interface BBUSegmentedViewController ()

@property (nonatomic) UIScrollView* childrenScrollView;

@end

#pragma mark -

@implementation BBUSegmentedViewController

-(id)init {
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeBottom;
    }
    return self;
}

-(void)segmentSelected:(UISegmentedControl*)segementedControl {
    CGPoint offset = CGPointMake(segementedControl.selectedSegmentIndex * self.childrenScrollView.width, 0.0);
    NSInteger oldIndex = self.childrenScrollView.contentOffset.x / self.childrenScrollView.width;
    UIView* snapshotView = nil;
    
    switch (self.transitionStyle) {
        case BBUSegmentedViewTransitionStyleLeftToRight:
        case BBUSegmentedViewTransitionStyleRightToLeft: {
            
            self.childrenScrollView.contentOffset = offset;
            
            snapshotView = [self.childrenScrollView.subviews[oldIndex] snapshotViewAfterScreenUpdates:NO];
            snapshotView.x = self.childrenScrollView.contentOffset.x;
            [self.childrenScrollView addSubview:snapshotView];
            
            [UIView animateWithDuration:0.3 animations:^{
                if (self.transitionStyle == BBUSegmentedViewTransitionStyleLeftToRight) {
                    snapshotView.x -= snapshotView.width;
                } else {
                    snapshotView.x += snapshotView.width;
                }
            } completion:^(BOOL finished) {
                [snapshotView removeFromSuperview];
            }];
            
            break;
        }
            
        case BBUSegmentedViewTransitionStyleNone:
            self.childrenScrollView.contentOffset = offset;
            break;
            
        case BBUSegmentedViewTransitionStyleScrolling:
            [self.childrenScrollView setContentOffset:offset animated:YES];
            break;
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* items = [self.childViewControllers valueForKeyPath:@"title"];
    
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.width = self.view.width - 2 * defaultMargin;
    segmentedControl.height = 50.0;
    segmentedControl.x = defaultMargin;
    segmentedControl.y = defaultMargin / 2;
    [self.view addSubview:segmentedControl];
    
    [segmentedControl addTarget:self
                         action:@selector(segmentSelected:)
               forControlEvents:UIControlEventValueChanged];
    
    self.childrenScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, CGRectGetMaxY(segmentedControl.frame) + segmentedControl.y, self.view.width, self.view.height - segmentedControl.height)];
    self.childrenScrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.childrenScrollView];
    
    self.childrenScrollView.contentSize = CGSizeMake(self.view.width * self.childViewControllers.count, self.childrenScrollView.height);
    self.childrenScrollView.scrollEnabled = NO;
    
    CGFloat xPosition = 0.0;
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UIViewController* controller = self.childViewControllers[i];
        controller.view.frame = self.childrenScrollView.bounds;
        [self.childrenScrollView addSubview:controller.view];
        
        controller.view.x += xPosition;
        xPosition += controller.view.width;
    }
}

@end
