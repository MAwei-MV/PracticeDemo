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
    [aCoder encodeObject:self.titleName forKey:@"titleName"];
    [aCoder encodeObject:self.caption forKey:@"String"];
    [aCoder encodeObject:self.checkItem forKey:@"CheckItem"];
    [aCoder encodeObject:self.num forKey:@"Number"];
    [aCoder encodeObject:self.items forKey:@"Default List"];
    
}
//decode
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.titleName = [aDecoder decodeObjectForKey:@"titleName"];
        self.caption = [aDecoder decodeObjectForKey: @"String"];
        self.checkItem = [aDecoder decodeObjectForKey: @"CheckItem"];
        self.num = [aDecoder decodeObjectForKey: @"Number"];
        self.items = [aDecoder decodeObjectForKey: @"Default List"];
    }
    return self;

}

@end
