//
//  ChecklistItemCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/16.
//

#import "ChecklistItemCell.h"
#import "Masonry.h"

@implementation ChecklistItemCell
{
    UILabel *keyLabel;
    UILabel *valueLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupLabel:(NSString *)keyText withValue:(NSString *)valueText {
    keyLabel = [[UILabel alloc] init];
    keyLabel.text = keyText;
    keyLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:keyLabel];
    [keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    valueLabel = [[UILabel alloc] init];
    valueLabel.text = valueText;
    valueLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:valueLabel];
    [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-50);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];

}

@end
