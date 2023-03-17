//
//  TestViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;
@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *checklists;

@end
