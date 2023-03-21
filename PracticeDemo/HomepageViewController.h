//
//  ViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "ChecklistViewController.h"

@class DataModel;

@interface HomepageViewController : UITableViewController<UINavigationControllerDelegate, ChecklistViewControllerDelegate>

@property (strong, nonatomic)DataModel *dataModel;

@end

