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

- (void) listDetailViewControllerDidCancel: (ListDetailViewController *) controller;
- (void) listDetailViewController: (ListDetailViewController *)controller didFinishEditingList: (Checklist *)checklist;

- (void) listDetailViewController: (ListDetailViewController *)controller didFinishAddingList: (Checklist *)checklist;

@end

@interface ListDetailViewController : UITableViewController

@property (nonatomic, strong) Checklist *checklist;
@property (nonatomic) int addType;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, weak) id<ListDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

