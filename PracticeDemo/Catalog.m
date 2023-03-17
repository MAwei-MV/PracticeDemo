//
//  Catalog.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import "Catalog.h"

@implementation Catalog

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.catalist = [aDecoder decodeObjectForKey:@"Catalist"];
    }
    return self;
}

- (NSComparisonResult)compare: (Catalog *)otherCatalog {
    //localizedStandarCompare对String类型数据进行排序
    return [self.name localizedStandardCompare:otherCatalog.name];
}

@end
