//
//  ItemDetailViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import <UIKit/UIKit.h>
#import "Checklist.h"

@class ListDetailViewController;
@protocol ListDetailViewControllerDelegate <NSObject>

- (void) listdetailViewControllerDidCancel: (ListDetailViewController *) controller;
- (void)listDetailViewController: (ListDetailViewController *)controller didFinishEditingList:(Checklist *)checklist;

@end

@interface ListDetailViewController : UITableViewController

@property (nonatomic, strong) Checklist *checklist;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, weak) id<ListDetailViewControllerDelegate> delegate;

@end

