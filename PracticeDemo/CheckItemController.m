//
//  ItemDetailController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "CheckItemController.h"
#import "ChecklistItemCell.h"
#import "ChecklistItem.h"
#import "ItemDetailViewController.h"

@implementation CheckItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNaviButton];
    //[self.tableView registerClass:ChecklistItemCell.self forCellReuseIdentifier:detailCellIdentifier];
}

- (void) setupNaviButton {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    self.navigationItem.rightBarButtonItem = right;
}

- (IBAction)addItem:(id)sender {
    ItemDetailViewController *nextController = [[ItemDetailViewController alloc] init];
    nextController.title = @"Add Item";
    nextController.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
    [self presentViewController:nav animated:YES completion:nil];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier forIndexPath:indexPath];
    ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier];
    if (!detailCell) {
        detailCell = [[ChecklistItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailCellIdentifier];
    } else {
        //重用时，删掉原来的控件
        [detailCell.keyLabel removeFromSuperview];
        [detailCell.valueLabel removeFromSuperview];
    }
    if ([self.items[indexPath.row] isKindOfClass:ChecklistItem.class]) {
        ChecklistItem *item = self.items[indexPath.row];
        [detailCell setupLabel:item indexFor:(int)indexPath.row];
    }
    detailCell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  detailCell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    ItemDetailViewController *nextController = [[ItemDetailViewController alloc] init];
    nextController.checklistItem = self.items[indexPath.row];
    nextController.title = @"Edit Item";
    nextController.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
}

#pragma mark -ItemDetailViewControllerDelegate
- (void)itemdetailViewControllerDidCancel:(ItemDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)checklistItem {
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)checklistItem {
    [self.items addObject:checklistItem];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
