//
//  ChecklistOptionViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/20.
//

#import "ChecklistOptionViewController.h"
#import "ListDetailViewController.h"
#import "Masonry.h"
#import <DKNightVersion/DKNightVersion.h>

@interface ChecklistOptionViewController ()

@end

@implementation ChecklistOptionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
}

- (id)init {
    if ((self = [super init])) {
        self.checklistOptions = [[NSMutableArray alloc] init];
        NSString *option;
        option = @"create a new NSString Object";
        [_checklistOptions addObject:option];
        
        option = @"create a new Number Object";
        [_checklistOptions addObject:option];
        
        option = @"create a new Date Object";
        [_checklistOptions addObject:option];
        
        option = @"create a new Array";
        [_checklistOptions addObject:option];
        
        option = @"create a new subFunction";
        [_checklistOptions addObject:option];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _checklistOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *optionCell = [tableView dequeueReusableCellWithIdentifier:optionIdentifier];
    if (!optionCell) {
        optionCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionIdentifier];
    }
    optionCell.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    int index = (int)indexPath.row;
    optionCell.textLabel.text = _checklistOptions[index];
    optionCell.textLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    optionCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return optionCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListDetailViewController *nextController = [[ListDetailViewController alloc] init];
    nextController.title = @"Add Checklist";
    nextController.addType = (int)indexPath.row;
    nextController.delegate = _checklistViewController;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nextController];
    [self presentViewController:nav animated:YES completion:nil];
    NSLog(@"Develop testLog");
}
@end
