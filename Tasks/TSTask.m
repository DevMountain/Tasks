//
//  TSTask.m
//  Tasks
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TSTask.h"

static NSString * const titleKey = @"title";
static NSString * const noteKey = @"note";
static NSString * const flagKey = @"flag";
static NSString * const completedKey = @"completed";

@interface TSTask ()

@property (nonatomic, strong) NSDate *completedDate;

@end

@implementation TSTask

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.note = dictionary[noteKey];
        self.flag = [dictionary[flagKey] boolValue];
        self.completedDate = dictionary[completedKey];
    }
    return self;
}

- (NSDictionary *)taskDictionary {

    NSMutableDictionary *taskDictionary = [NSMutableDictionary new];
    if (self.title) {
        [taskDictionary setObject:self.title forKey:titleKey];
    }
    if (self.note) {
        [taskDictionary setObject:self.note forKey:noteKey];
    }
    if (self.completedDate) {
        [taskDictionary setObject:self.completedDate forKey:completedKey];
    }
    [taskDictionary setObject:[NSNumber numberWithBool:self.flag] forKey:flagKey];

    return taskDictionary;
}

- (void)markCompleted:(BOOL)completed {
    if (completed) {
        self.completedDate = [NSDate date];
    } else {
        self.completedDate = nil;
    }
}

@end
