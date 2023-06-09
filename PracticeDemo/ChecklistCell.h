//
//  TestCell.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>
#import "Checklist.h"

static NSString *cellIdentifier = @"ChecklistCell";
@interface ChecklistCell : UITableViewCell

@property(nonatomic, strong) UILabel *keyLabel;
@property(nonatomic, strong) UILabel *valueLabel;
@property(nonatomic, strong) UISwitch *valueSwitch;
@property (nonatomic, strong) Checklist *checklist;

- (void)setupLabels: (NSString *) caption withTitle: (NSString *) titlename;
- (void)setupSwitch: (BOOL) boolValue withTitle: (NSString *) titleName;

@end
