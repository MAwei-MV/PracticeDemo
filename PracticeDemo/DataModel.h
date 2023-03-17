//  DataModel.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong)NSMutableArray *lists;

- (void)sortCatalog;
- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist: (NSInteger)index;

@end
