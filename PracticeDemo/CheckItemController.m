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
#import "Masonry.h"
#import <DKNightVersion/DKNightVersion.h>

@implementation CheckItemController
{
    //利用NSUndoManager实现撤销操作
    NSUndoManager *undoManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNaviButton];
    undoManager = [[NSUndoManager alloc] init];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
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
    return [self.items count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier forIndexPath:indexPath];
    ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier];
    if (!detailCell) {
        detailCell = [[ChecklistItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailCellIdentifier];
    } else {
        //重用时，删掉原来的控件
        detailCell.accessoryType = UITableViewCellAccessoryNone;
        [detailCell.keyLabel removeFromSuperview];
        [detailCell.valueLabel removeFromSuperview];
        [detailCell.undoButton removeFromSuperview];
    }
    //最后一行添加Undo/Redo功能
    detailCell.delegate = self;
    detailCell.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    if (indexPath.row == self.items.count) {
        [detailCell setupUndoLabel];
        return detailCell;
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
    if (indexPath.row == (int)self.items.count) return;
    ChecklistItem *item = self.items[indexPath.row];
    [self deleteItem:item indexFor: (int)indexPath.row];
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
    [self addNewItem:checklistItem indexFor:(int)self.items.count];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addNewItem: (ChecklistItem *)checklistItem indexFor: (int) index {
    //[undoManager registerUndoWithTarget:self selector:@selector(deleteItem:) indexFor:index  object:checklistItem];
    [[undoManager prepareWithInvocationTarget:self] deleteItem:checklistItem indexFor:index];
    [self.items insertObject:checklistItem atIndex:index];
}

- (void)deleteItem: (ChecklistItem *)checklistItem indexFor: (int) index {
    [[undoManager prepareWithInvocationTarget:self] addNewItem:checklistItem indexFor:index];
    [self.items removeObject:checklistItem];

}

#pragma mark UndoOperationDelegate
- (void)undoOperation {
    if ([undoManager canUndo]) {
        [undoManager undo];
        [self.tableView reloadData];
    }
}

@end
