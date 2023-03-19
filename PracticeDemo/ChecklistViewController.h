//
//  TestViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@class Checklist;
@interface ChecklistViewController : UITableViewController <DetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *checklists;

@end
