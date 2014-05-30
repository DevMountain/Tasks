//
//  TSTask.h
//  Tasks
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSTask : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong, readonly) NSDate *completedDate;

- (void)markCompleted:(BOOL)completed;

- (NSDictionary *)taskDictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
