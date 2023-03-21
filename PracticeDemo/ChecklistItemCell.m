//
//  ChecklistItemCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import "ChecklistItemCell.h"
#import "Masonry.h"
#import "ChecklistItem.h"

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
    [self addSubview:_valueLabel];
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-50);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];

}

@end
