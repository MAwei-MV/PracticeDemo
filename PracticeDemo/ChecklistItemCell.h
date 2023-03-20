//
//  ChecklistItemCell.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import <UIKit/UIKit.h>
#import "ChecklistItem.h"

static NSString *detailCellIdentifier = @"ItemDetailCell";
@interface ChecklistItemCell : UITableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UILabel *valueLabel;

- (void)setupLabel: (ChecklistItem *) item;

@end
