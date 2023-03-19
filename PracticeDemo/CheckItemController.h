//
//  ItemDetailController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface CheckItemController : UITableViewController <DetailViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *items;

@end
