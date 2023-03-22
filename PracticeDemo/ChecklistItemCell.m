//
//  ChecklistItemCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import "ChecklistItemCell.h"
#import "Masonry.h"
#import "ChecklistItem.h"
#import <DKNightVersion/DKNightVersion.h>

@implementation ChecklistItemCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setupLabel:(ChecklistItem *)item indexFor:(int) index {
    NSString *valueText = item.valueText;
    _keyLabel = [[UILabel alloc] init];
    _keyLabel.text = [@"Item " stringByAppendingString: @(index).stringValue];
    _keyLabel.textAlignment = NSTextAlignmentLeft;
    _keyLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    [self addSubview:_keyLabel];
    [_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    _valueLabel = [[UILabel alloc] init];
    _valueLabel.text = valueText;
    _valueLabel.textAlignment = NSTextAlignmentRight;
    _valueLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    [self addSubview:_valueLabel];
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-50);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];

}

- (void)setupUndoLabel {
    UIButton *button = [[UIButton alloc] init];
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 5, 0, 5);
    button.backgroundColor = UIColor.grayColor;
    [button setTitle:@"撤销" forState:UIControlStateNormal];
    button.titleLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(padding);
    }];
    self.undoButton = button;
}

- (IBAction)clickButton:(id)sender {
    //触发撤销事件
    [self.delegate undoOperation];
}

@end
