//  DataModel.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <Foundation/Foundation.h>
#import <DKNightVersion/DKNightVersion.h>

@interface DataModel : NSObject

@property (nonatomic, strong)NSMutableArray *lists;
@property (nonatomic, strong)DKNightVersionManager *manager;

- (void)sortCatalog;
- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist: (NSInteger)index;

@end
