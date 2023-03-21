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
    [aCoder encodeObject:self.titleName forKey:@"TitleName"];
    [aCoder encodeObject:self.subCategory forKey:@"SubCategory"];
    [aCoder encodeObject:self.caption forKey:@"Caption"];
    [aCoder encodeObject:self.checkItem forKey:@"CheckItem"];
    [aCoder encodeObject:self.num forKey:@"Num"];
    [aCoder encodeObject:self.items forKey:@"CheckLists"];
    [aCoder encodeObject:self.date forKey:@"Date"];
    
}
//decode
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.titleName = [aDecoder decodeObjectForKey:@"TitleName"];
        self.subCategory = [aDecoder decodeObjectForKey:@"SubCategory"];
        self.caption = [aDecoder decodeObjectForKey: @"Caption"];
        self.checkItem = [aDecoder decodeObjectForKey: @"CheckItem"];
        self.num = [aDecoder decodeObjectForKey: @"Num"];
        self.items = [aDecoder decodeObjectForKey: @"CheckLists"];
        self.date = [aDecoder decodeObjectForKey:@"Date"];
    }
    return self;
}

@end
