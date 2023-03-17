//
//  Catalog.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import <Foundation/Foundation.h>

@class Checklist;
@interface Catalog : NSObject <NSCoding>

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong) NSMutableArray *catalist;

@end
