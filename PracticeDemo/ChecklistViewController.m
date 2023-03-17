//
//  TestViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistViewController.h"
#import "ChecklistCell.h"
#import "Checklist.h"
#import "ItemDetailController.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:ChecklistCell.self forCellReuseIdentifier:cellIdentifier];
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
    ChecklistCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ChecklistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Checklist *list = self.checklists[indexPath.row];
    //先判断是否为二级分类
    if (list.subCategory != nil) {
        Catalog *subCata = list.subCategory;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = subCata.name;
    } else if (list.checkItem != nil) {
            [cell setupSwitch:([list.checkItem  isEqual: @1]) withTitle:list.titleName];
    } else if (list.caption != nil) {
            [cell setupLabels:list.caption withTitle:list.titleName];
    } else if (list.num != nil) {
            NSNumberFormatter *tempNum = [[NSNumberFormatter alloc] init];
            NSString *resStr = [tempNum stringFromNumber:list.num];
            [cell setupLabels:resStr withTitle:list.titleName];
    } else if (list.items != nil) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = list.titleName;
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
            ItemDetailController *nextController = [[ItemDetailController alloc] init];
            nextController.items = list.items;
            [self.navigationController pushViewController:nextController animated:YES];
    }
}

@end
