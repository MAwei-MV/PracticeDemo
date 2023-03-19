//
//  TestViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class Checklist;
@interface ChecklistViewController : UITableViewController <ListDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *checklists;

@end
