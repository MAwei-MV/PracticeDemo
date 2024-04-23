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
    self.title = @"HomePage";
    DataModel *dataSource = [[DataModel alloc] init];
    self.dataModel = dataSource;
    [self.dataModel sortCatalog];
    [self setupNightModeBar];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    NSLog(@"feature branch commit 1");
}

- (void) setupNightModeBar {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 32)];
    [rightButton setTitle:@"night" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    rightButton.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    [rightButton addTarget:self action:@selector(switchNight:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    NSLog(@"feature branch commit 2");
}

-(IBAction)switchNight:(id)sender {
    if(self.dataModel.manager.themeVersion == DKThemeVersionNight) {
        self.dataModel.manager.themeVersion = DKThemeVersionNormal;
    } else {
        self.dataModel.manager.themeVersion = DKThemeVersionNight;
    }
    NSLog(@"feature branch commit 3");
}


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
    cell.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    Catalog *catalog = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = catalog.name;
    cell.textLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    cell.detailTextLabel.text = ([@(catalog.catalist.count).stringValue stringByAppendingString:@"项"]);
    cell.detailTextLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
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
    nextController.delegate = self;
    [self.navigationController pushViewController:nextController animated:YES];
}

#pragma mark ChecklistViewController
- (void)updateChecklistCounts {
    [self.tableView reloadData];
}

@end
