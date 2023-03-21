//
//  ChecklistItem.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import "ChecklistItem.h"

@implementation ChecklistItem


//encode
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.keyText forKey:@"KeyText"];
    [aCoder encodeObject:self.valueText forKey:@"ValueText"];
    
}
//decode
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.keyText = [aDecoder decodeObjectForKey:@"KeyText"];
        self.valueText = [aDecoder decodeObjectForKey:@"ValueText"];
    }
    return self;
}

@end
