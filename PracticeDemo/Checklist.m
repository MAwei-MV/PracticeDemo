//
//  DataModel.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "Checklist.h"

@implementation Checklist

//encode
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.subCategory forKey:@"Sub Function"];
    [aCoder encodeObject:self.caption forKey:@"String"];
    [aCoder encodeBool:self.checkItem forKey:@"CheckItem"];
    [aCoder encodeObject:self.num forKey:@"Number"];
    [aCoder encodeObject:self.items forKey:@"Default List"];
    
}
//decode
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.subCategory = [aDecoder decodeObjectForKey: @"Sub Function"];
        self.caption = [aDecoder decodeObjectForKey: @"String"];
        self.checkItem = [aDecoder decodeObjectForKey: @"CheckItem"];
        self.num = [aDecoder decodeObjectForKey: @"Number"];
        self.items = [aDecoder decodeObjectForKey: @"Default List"];
    }
    return self;

}

@end
