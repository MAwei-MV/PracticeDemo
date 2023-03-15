//
//  TestViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistViewController.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChecklistCell"];
    }
    cell.textLabel.text = @"23123123";
    return cell;    
}

@end
