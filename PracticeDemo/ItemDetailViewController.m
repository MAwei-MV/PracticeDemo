//
//  ItemDetailViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import "ItemDetailViewController.h"
#import "Masonry.h"
#import "ChecklistItem.h"
#import <DKNightVersion/DKNightVersion.h>

@implementation ItemDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNaviButton];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void) setupNaviButton {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = right;
    self.navigationItem.leftBarButtonItem = left;
}

- (IBAction)cancel {
    [self.delegate itemdetailViewControllerDidCancel:self];
}

- (IBAction)done {
    if (!self.checklistItem) {
        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.valueText = _field.text;
        [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    } else {
        self.checklistItem.valueText = _field.text;
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.checklistItem];
    }
}

- (void) setupTextField: (UITableViewCell*) cell {
    UITextField *newField = [[UITextField alloc] init];
    if (self.checklistItem != nil) {
        newField.text = self.checklistItem.valueText;
    }
    [cell addSubview:newField];
    UIEdgeInsets padding = UIEdgeInsetsMake(5, 20, 5, 20);
    [newField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell).with.insets(padding);
    }];
    self.field = newField;
    newField.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    [self.field becomeFirstResponder];
//  self.field.keyboardType = UIKeyboardTypeDecimalPad;
//  [self.field reloadInputViews];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ItemDetailViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    [self setupTextField:cell];
    return cell;
}

@end
