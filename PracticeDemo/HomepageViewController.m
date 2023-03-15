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

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First Level";
    DataModel *dataSource = [[DataModel alloc] init];
    self.dataModel = dataSource;
}
//TODO: update caculate the count in controller
- (int) getCountOfContent {
    int count = 0;
    return 3;
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
    Checklist *list = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = list.caption;
    cell.detailTextLabel.text = (@"subTitle of Title");
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
    nextController.checklist = self.dataModel.lists[row];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
