//
//  ItemDetailViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import <UIKit/UIKit.h>
#import "Checklist.h"
#import "ChecklistItem.h"

@class DetailViewController;
@protocol DetailViewControllerDelegate <NSObject>

- (void) detailViewControllerDidCancel: (DetailViewController *) controller;
- (void)listDetailViewController: (DetailViewController *)controller didFinishEditingList:(Checklist *)checklist;

- (void)itemDetailViewController: (DetailViewController *)controller didFinishEditingItem: (ChecklistItem *)checklistItem;

@end

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Checklist *checklist;
@property (nonatomic, strong) ChecklistItem *checklistItem;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, weak) id<DetailViewControllerDelegate> delegate;

@end

