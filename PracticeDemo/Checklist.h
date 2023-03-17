//
//  DataModel.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <Foundation/Foundation.h>
#import "Catalog.h"

@interface Checklist :NSObject <NSCoding>

@property (nonatomic, strong, nonnull) NSString *titleName;
@property (nullable, nonatomic)Catalog *subCategory;
@property (nonatomic, nullable)NSString *caption;
@property (nonatomic, nullable)NSNumber *checkItem;
@property (nonatomic, nullable)NSMutableArray *items;
@property (nonatomic, nullable)NSNumber *num;


@end
