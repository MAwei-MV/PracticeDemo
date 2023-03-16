//
//  ChecklistItem.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.keyText forKey:@"keyText"];
    [aCoder encodeObject:self.valueText forKey:@"valueText"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.keyText = [aDecoder decodeObjectForKey: @"keyText"];
        self.valueText = [aDecoder decodeObjectForKey:@"valueText"];
    }
    return self;
}

@end
