//
//  ItemDetailViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import <UIKit/UIKit.h>
#import "Checklist.h"

@class ItemDetailViewController;
@protocol ItemDetailViewControllerDelegate <NSObject>

- (void) detailViewControllerDidCancel: (ItemDetailViewController *) controller;
- (void)listDetailViewController: (ItemDetailViewController *)controller didFinishEditingList:(Checklist *)checklist;

- (void)itemDetailViewController: (ItemDetailViewController *)controller didFinishEditingItem: (NSString *)checklistItem;

@end

@interface ItemDetailViewController : UITableViewController

@property (nonatomic, strong) Checklist *checklist;
@property (nonatomic, strong) NSString *checklistItem;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, weak) id<ItemDetailViewControllerDelegate> delegate;

@end

