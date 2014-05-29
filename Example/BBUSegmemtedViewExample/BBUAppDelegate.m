//
//  BBUAppDelegate.m
//  BBUSegmemtedViewExample
//
//  Created by Boris Bügling on 28/05/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <BBUSegmentedViewController/BBUSegmentedViewController.h>

#import "BBUAppDelegate.h"

@implementation BBUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController* controller1 = [UIViewController new];
    controller1.title = NSLocalizedString(@"foo", nil);
    controller1.view.backgroundColor = [UIColor greenColor];
    
    UIViewController* controller2 = [UIViewController new];
    controller2.title = NSLocalizedString(@"bar", nil);
    controller2.view.backgroundColor = [UIColor redColor];
    
    UIViewController* controller3 = [UIViewController new];
    controller3.title = NSLocalizedString(@"baz", nil);
    controller3.view.backgroundColor = [UIColor blackColor];
    
    BBUSegmentedViewController* segmentedViewController = [BBUSegmentedViewController new];
    segmentedViewController.transitionStyle = BBUSegmentedViewTransitionStyleLeftToRight;
    segmentedViewController.title = NSLocalizedString(@"Segemented Controller", nil);
    [segmentedViewController addChildViewController:controller1];
    [segmentedViewController addChildViewController:controller2];
    [segmentedViewController addChildViewController:controller3];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc]
                                      initWithRootViewController:segmentedViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
