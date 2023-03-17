//
//  ItemDetailViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import "ItemDetailViewController.h"
#import "Masonry.h"

@implementation ItemDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"ItemDetailViewCell"];
    [self setupButton];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void) setupButton {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = right;
    self.navigationItem.leftBarButtonItem = left;
}

- (IBAction)cancel {
    [self.delegate detailViewControllerDidCancel:self];
}

- (IBAction)done {
    if (_checklist != nil) {
        if (_checklist.num != nil) {
            NSNumber *newNum = @([_field.text intValue]);
            self.checklist.num = newNum;
        } else {
            self.checklist.caption = _field.text;
        }
        [self.delegate listDetailViewController:self didFinishEditingList:self.checklist];
    } else {
        self.checklistItem = _field.text;
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.checklistItem];
    }
}

- (void) setupTextField: (UITableViewCell*) cell {
    UITextField *newField = [[UITextField alloc] init];
    if (self.checklist != nil) {
        if (self.checklist.num != nil) {
            newField.text = self.checklist.num.description;
        } else {
            newField.text = self.checklist.caption;
        }
    } else {
        newField.text = self.checklistItem;
    }
    [cell addSubview:newField];
    UIEdgeInsets padding = UIEdgeInsetsMake(5, 20, 5, 20);
    [newField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell).with.insets(padding);
    }];
    self.field = newField;
    [self.field becomeFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ItemDetailViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [self setupTextField:cell];
    return cell;
}

@end
