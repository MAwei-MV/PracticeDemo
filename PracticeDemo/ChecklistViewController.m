//
//  TestViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistViewController.h"
#import "ChecklistCell.h"
#import "Checklist.h"
#import "CheckItemController.h"
#import "ListDetailViewController.h"
#import "ChecklistItem.h"
#import "ChecklistOptionViewController.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNaviButton];
    //[self.tableView registerClass:ChecklistCell.self forCellReuseIdentifier:cellIdentifier];
}

- (void) setupNaviButton {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(addChecklist:)];
    self.navigationItem.rightBarButtonItem = right;
}

- (IBAction)addChecklist: (id)sender{
    ChecklistOptionViewController *nextController = [[ChecklistOptionViewController alloc] init];
    nextController.title = @"Add Checklist";
    nextController.checklistViewController = self;
    [self.navigationController pushViewController:nextController animated:YES];
}

#pragma mark - Table view cell style

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.checklists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChecklistCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[ChecklistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    } else {
        //重用时，删掉原先的控件，否则会有重叠效果
        cell.textLabel.text = nil;
        [cell.keyLabel removeFromSuperview];
        [cell.valueLabel removeFromSuperview];
        [cell.valueSwitch removeFromSuperview];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    Checklist *list = self.checklists[indexPath.row];
    cell.checklist = list;
    //判断是否为二级分类
    if (list.subCategory != nil) {
        Catalog *subCata = list.subCategory;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = subCata.name;
    } else if (list.checkItem != nil) {
        [cell setupSwitch:([list.checkItem  isEqual: @1]) withTitle:list.titleName];
    } else if (list.caption != nil) {
        [cell setupLabels:list.caption withTitle:list.titleName];
    } else if (list.num != nil) {
        //NSNumberFormatter *tempNum = [[NSNumberFormatter alloc] init];
        NSString *resStr = [NSString stringWithFormat:@"%20@",list.num];
        //NSString *resStr = [tempNum stringWit:list.num];
        [cell setupLabels:resStr withTitle:list.titleName];
    } else if (list.items != nil) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = list.titleName;
    } else if (list.date != nil) {
        NSDateFormatter* df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"YYYY-MM-dd HH:mm:ss";
        NSString *dateValue = [df stringFromDate:list.date];
        [cell setupLabels:dateValue withTitle:list.titleName];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //如果是二级分类
    Checklist *list =self.checklists[indexPath.row];
    if (list.subCategory != nil) {
        Catalog *subCata = list.subCategory;
        ChecklistViewController *nextController = [[ChecklistViewController alloc] init];
        nextController.checklists = subCata.catalist;
        [self.navigationController pushViewController:nextController animated:YES];
    } else if (list.items != nil) {
        CheckItemController *nextController = [[CheckItemController alloc] init];
        nextController.items = list.items;
        [self.navigationController pushViewController:nextController animated:YES];
    } else if (list.caption != nil) {
        ListDetailViewController *nextController = [[ListDetailViewController alloc] init];
        nextController.checklist = list;
        nextController.title = @"Edit String";
        nextController.delegate = self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
        [self presentViewController:nav animated:YES completion:nil];
    } else if (list.num != nil) {
        ListDetailViewController *nextController = [[ListDetailViewController alloc] init];
        nextController.checklist = list;
        nextController.title = @"Edit Number";
        nextController.delegate = self;
        nextController.field.keyboardType = UIKeyboardTypeDecimalPad;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
        [self presentViewController:nav animated:YES completion:nil];
    } else if (list.date != nil) {
        ListDetailViewController *nextController = [[ListDetailViewController alloc] init];
        nextController.checklist = list;
        nextController.title = @"Edit Date";
        nextController.delegate = self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.checklists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Checklist *list = self.checklists[indexPath.row];
    if (list.checkItem != nil) {
        return nil;
    }
    return indexPath;
}

#pragma mark - ItemDetailViewControllerDelegate

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingList:(Checklist *)checklist {
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingList:(Checklist *)checklist {
    [self.checklists addObject:checklist];
    [self.tableView reloadData];
    //先在.navigationController中退出ChecklistOptionViewController页面，然后再退出ListDetailViewController.
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
