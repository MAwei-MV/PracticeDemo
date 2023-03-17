//
//  ItemDetailController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "CheckItemController.h"
#import "ChecklistItemCell.h"
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
    NSString *item = self.items[indexPath.row];
    NSString *keyValue = [@"Item " stringByAppendingString: [NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    [detailCell setupLabel:keyValue withValue: item];
    detailCell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  detailCell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSString *item = self.items[indexPath.row];
    ItemDetailViewController *nextController = [[ItemDetailViewController alloc] init];
    nextController.checklistItem = item;
    nextController.title = @"Edit Item";
    nextController.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
    [self presentViewController:nav animated:YES completion:nil];

}

- (void)detailViewControllerDidCancel:(ItemDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(NSString *)checklistItem {
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
