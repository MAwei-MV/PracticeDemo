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
    [self.tableView registerClass:ChecklistItemCell.self forCellReuseIdentifier:detailCellIdentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier forIndexPath:indexPath];
    ChecklistItemCell *detailCell = [tableView cellForRowAtIndexPath:indexPath];
    if (detailCell == nil) {
        detailCell = [[ChecklistItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailCellIdentifier];
    }
    if ([self.items[indexPath.row] isKindOfClass:ChecklistItem.class]) {
        ChecklistItem *item = self.items[indexPath.row];
        [detailCell setupLabel:item];
    }
    detailCell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  detailCell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSString *valueText = self.items[indexPath.row];
    ItemDetailViewController *nextController = [[ItemDetailViewController alloc] init];
    nextController.checklistItem = self.items[indexPath.row];
    nextController.title = @"Edit Item";
    nextController.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
    [self presentViewController:nav animated:YES completion:nil];

}

#pragma mark -ItemDetailViewControllerDelegate
- (void)itemdetailViewControllerDidCancel:(ItemDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)checklistItem {
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
