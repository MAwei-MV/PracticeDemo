//  DataModel.h
//  PracticeDemo
//
//  Created by 周婷玉 on 2023/3/15.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong)NSMutableArray *lists;

- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist: (NSInteger)index;

@end
