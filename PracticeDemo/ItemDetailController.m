//
//  ItemDetailController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ItemDetailController.h"
#import "ChecklistItemCell.h"

@implementation ItemDetailController

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
    ChecklistItemCell *detailCell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier forIndexPath:indexPath];
    if (detailCell == nil) {
        detailCell = [[ChecklistItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailCellIdentifier];
    }
    NSString *item = self.items[indexPath.row];
    NSString *keyValue = [@"Item " stringByAppendingString: [NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    [detailCell setupLabel:keyValue withValue: item];
    detailCell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  detailCell;
}

@end
