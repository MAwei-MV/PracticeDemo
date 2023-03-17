//
//  ItemDetailController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@interface CheckItemController : UITableViewController <ItemDetailViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *items;

@end
