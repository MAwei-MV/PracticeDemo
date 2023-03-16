//
//  TestCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistCell.h"
#import "Checklist.h"
#import "Masonry.h"

@implementation ChecklistCell
{
    UISwitch *costom;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setupLabels:(NSString *)caption withTitle:(NSString *)titlename {
    UILabel *keyLabel = [[UILabel alloc] init];
    keyLabel.text = titlename;
    keyLabel.textAlignment = NSTextAlignmentLeft;
    
    UILabel *valueLabel = [[UILabel alloc] init];
    valueLabel.text = caption;
    valueLabel.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:keyLabel];
    [self addSubview:valueLabel];
    
    [keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self).with.offset(-20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
}

- (void) setupSwitch:(BOOL)boolValue withTitle:(NSString *)titleName{
    costom = [[UISwitch alloc] init];
    costom.on = boolValue;
    
    UILabel *keyLabel = [[UILabel alloc] init];
    keyLabel.text = titleName;
    keyLabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:keyLabel];
    [self addSubview:costom];

    [keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    [costom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self);
    }];
}

@end
