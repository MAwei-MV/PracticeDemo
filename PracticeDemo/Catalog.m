//
//  Catalog.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import "Catalog.h"

@implementation Catalog

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"CatalistName"];
    [aCoder encodeObject:self.catalist forKey:@"Catalist"];

}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:@"CatalistName"];
        self.catalist = [aDecoder decodeObjectForKey:@"Catalist"];
    }
    return self;
}

- (NSComparisonResult)compare: (Catalog *)otherCatalog {
    //localizedStandarCompare对String类型数据进行排序
    return [self.name localizedStandardCompare:otherCatalog.name];
}

@end
