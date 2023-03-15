//
//  ChecklistItem.m
//  PracticeDemo
//
//  Created by 周婷玉 on 2023/3/15.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey: @"Text"];
    }
    return self;
}

@end
