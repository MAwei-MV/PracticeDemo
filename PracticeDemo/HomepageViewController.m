//
//  ViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "HomepageViewController.h"
#import "ChecklistViewController.h"
#import "DataModel.h"
#import "Checklist.h"
#import "Catalog.h"

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First Level";
    DataModel *dataSource = [[DataModel alloc] init];
    self.dataModel = dataSource;
}

#pragma mark
#pragma mark Table Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *FirstLevelCell = @"FirstLevelCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:FirstLevelCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FirstLevelCell];
    }
    Catalog *catalog = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = catalog.name;
    cell.detailTextLabel.text = ([@(catalog.catalist.count).stringValue stringByAppendingString:@"项"]);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    //configure the cell
//    NSUInteger row = [indexPath row];
//    TestViewController *controller = [_controllers objectAtIndex:row];
//    cell.textLabel.text = controller.title;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    ChecklistViewController *nextController = [[ChecklistViewController alloc] init];
    nextController.checklists = [self.dataModel.lists[row] catalist];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
