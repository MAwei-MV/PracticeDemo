//
//  Catalog.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong) NSMutableArray *catalist;
@property (nonatomic, strong)Catalog* subCategory;

@end
