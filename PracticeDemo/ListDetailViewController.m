//
//  ItemDetailViewController.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/17.
//

#import "ListDetailViewController.h"
#import "Masonry.h"
#import "Catalog.h"

@implementation ListDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"ListDetailViewCell"];
    [self setupNaviButton];
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
    [self.delegate listDetailViewControllerDidCancel:self];
}

- (IBAction)done {
    if (!self.checklist) {
        Checklist *newChecklist = [[Checklist alloc] init];
        if (self.addType == 0) {
            newChecklist.titleName = @"String";
            newChecklist.caption = _field.text;
        } else if (self.addType == 1) {
            newChecklist.titleName = @"Number";
            newChecklist.num = @([_field.text doubleValue]);
        } else if (self.addType == 2) {
            //待补充
        } else if (self.addType == 3) {
            NSMutableArray *newArray = [[NSMutableArray alloc] init];
            newChecklist.items = newArray;
            newChecklist.titleName = _field.text;
        } else if (self.addType == 4) {
            Catalog *newCatalog = [[Catalog alloc] init];
            NSMutableArray *newArray = [[NSMutableArray alloc] init];
            newCatalog.name = _field.text;
            newCatalog.catalist = newArray;
            newChecklist.subCategory = newCatalog;
        }
        [self.delegate listDetailViewController:self didFinishAddingList:newChecklist];
    }
    if (self.checklist.num != nil) {
        NSNumber *newNum = @([_field.text doubleValue]);
        self.checklist.num = newNum;
    } else if (self.checklist.caption != nil) {
        self.checklist.caption = _field.text;
    }
    [self.delegate listDetailViewController:self didFinishEditingList:self.checklist];
}

- (void) setupTextField: (UITableViewCell*) cell {
    UITextField *newField = [[UITextField alloc] init];
    if (self.checklist !=nil && self.checklist.num != nil) {
        newField.keyboardType = UIKeyboardTypeDecimalPad;
        newField.text = self.checklist.num.description;
    } else if (self.checklist != nil && self.checklist.caption != nil) {
        newField.text = self.checklist.caption;
    } else if (self.addType == 1) {
        newField.keyboardType = UIKeyboardTypeDecimalPad;
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
    static NSString *identifier = @"ListDetailViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [self setupTextField:cell];
    return cell;
}

@end
