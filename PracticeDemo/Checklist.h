//
//  DataModel.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <Foundation/Foundation.h>

@interface Checklist :NSObject <NSCoding>

@property (nullable, nonatomic)Checklist *subCategory;
@property (nonatomic, nullable)NSString *caption;
@property (nonatomic, assign, nullable)NSDictionary *checkItem;
@property (nonatomic, nullable)NSMutableArray *items;
@property (nonatomic, nullable)NSNumber *num;


@end
