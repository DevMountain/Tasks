//
//  TSAppDelegate.m
//  Tasks
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TSAppDelegate.h"

#import "TSTaskController.h"

@implementation TSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NSLog(@"%ld",(unsigned long)[[TSTaskController sharedInstance].tasks count]);
    
    TSTask *task = [TSTask new];
    task.title = @"A new task";
    task.flag = NO;
    task.note = @"Some notes about the task";
    [task markCompleted:YES];
    
    [[TSTaskController sharedInstance] addTask:task];
    
    return YES;
}

@end
