//
//  TSTaskController.m
//  Tasks
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TSTaskController.h"

static NSString * const taskListKey = @"taskList";

@interface TSTaskController ()

@property (nonatomic, strong) NSArray *tasks;

@end

@implementation TSTaskController

+ (TSTaskController *)sharedInstance {
    static TSTaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TSTaskController alloc] init];
    
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)setTasks:(NSArray *)tasks {
    _tasks = tasks;
    
    [self synchronize];
}

- (void)addTask:(TSTask *)task {

    NSMutableArray *mutableTasks = [[NSMutableArray alloc] initWithArray:self.tasks];
    [mutableTasks addObject:task];

    self.tasks = mutableTasks;
}

- (void)removeTask:(TSTask *)task {

    NSMutableArray *mutableTasks = self.tasks.mutableCopy;
    [mutableTasks removeObject:task];
    
    self.tasks = mutableTasks;
    
}

- (void)loadFromDefaults {
    
    NSArray *taskDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:taskListKey];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (NSDictionary *task in taskDictionaries) {
        [tasks addObject:[[TSTask alloc] initWithDictionary:task]];
    }
    
    self.tasks = tasks;
    
}

- (void)synchronize {
    
    NSMutableArray *taskDictionaries = [NSMutableArray new];
    for (TSTask *task in self.tasks) {
        [taskDictionaries addObject:[task taskDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:taskDictionaries forKey:taskListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
