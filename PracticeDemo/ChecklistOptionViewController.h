//
//  ChecklistOptionViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/20.
//

#import <UIKit/UIKit.h>
#import "ChecklistViewController.h"

static NSString *optionIdentifier = @"optionIdentiferCell";
static int checklistType = 5;

@interface ChecklistOptionViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *checklistOptions;
@property (weak, nonatomic) ChecklistViewController *checklistViewController;

@end
