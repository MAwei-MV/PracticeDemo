//
//  ChecklistItemCell.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import <UIKit/UIKit.h>
#import "ChecklistItem.h"

@protocol UndoOperationDelegate <NSObject>

- (void) undoOperation;

@end

static NSString *detailCellIdentifier = @"ItemDetailCell";
@interface ChecklistItemCell : UITableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIButton *undoButton;
@property (nonatomic, weak) id<UndoOperationDelegate> delegate;

- (void)setupLabel: (ChecklistItem *) item indexFor:(int) index;
- (void)setupUndoLabel;

@end
