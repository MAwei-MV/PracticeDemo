//
//  TestCell.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>

static NSString *cellIdentifier = @"ChecklistCell";
@interface ChecklistCell : UITableViewCell

- (void)setupLabels: (NSString *) caption withTitle: (NSString *) titlename;
- (void)setupSwitch: (BOOL) boolValue withTitle: (NSString *) titleName;

@end
