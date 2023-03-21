//
//  TestViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@protocol ChecklistViewControllerDelegate <NSObject>

- (void) updateChecklistCounts;

@end

@class Checklist;
@interface ChecklistViewController : UITableViewController <ListDetailViewControllerDelegate, ChecklistViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *checklists;
@property (nonatomic, weak) id<ChecklistViewControllerDelegate> delegate;

@end
