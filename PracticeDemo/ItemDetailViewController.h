//
//  ItemDetailViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/19.
//

#import <UIKit/UIKit.h>


@class ItemDetailViewController;
@class ChecklistItem;
@protocol ItemDetailViewControllerDelegate <NSObject>

- (void) itemdetailViewControllerDidCancel: (ItemDetailViewController *) controller;
- (void) itemDetailViewController: (ItemDetailViewController *)controller didFinishEditingItem: (ChecklistItem *)checklistItem;
- (void) itemDetailViewController: (ItemDetailViewController *)controller didFinishAddingItem: (ChecklistItem *)checklistItem;

@end

@interface ItemDetailViewController : UITableViewController

@property (nonatomic, strong) ChecklistItem *checklistItem;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, weak) id<ItemDetailViewControllerDelegate> delegate;

@end

