//
//  ItemDetailController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
#import "ChecklistItemCell.h"

@interface CheckItemController : UITableViewController <ItemDetailViewControllerDelegate, UndoOperationDelegate>

@property (strong, nonatomic) NSMutableArray *items;

@end
