//
//  TSTaskController.h
//  Tasks
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSTask.h"

@interface TSTaskController : NSObject

@property (nonatomic, strong, readonly) NSArray *tasks;

+ (TSTaskController *)sharedInstance;

- (void)addTask:(TSTask *)task;
- (void)removeTask:(TSTask *)task;

@end
