//
//  TestCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "ChecklistCell.h"
#import "Checklist.h"
#import "Masonry.h"
#import <DKNightVersion/DKNightVersion.h>

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
    self.keyLabel = [[UILabel alloc] init];
    _keyLabel.text = titlename;
    _keyLabel.textAlignment = NSTextAlignmentLeft;
    _keyLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    
    self.valueLabel = [[UILabel alloc] init];
    _valueLabel.text = caption;
    _valueLabel.textAlignment = NSTextAlignmentRight;
    _valueLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    [self addSubview:_keyLabel];
    [self addSubview:_valueLabel];
    
    [_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self).with.offset(-20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(200);
    }];
}

- (void) setupSwitch:(BOOL)boolValue withTitle:(NSString *)titleName{
    self.valueSwitch = [[UISwitch alloc] init];
    _valueSwitch.on = boolValue;
    [_valueSwitch addTarget:self action:@selector(switchAction: ) forControlEvents:UIControlEventValueChanged];
    self.keyLabel = [[UILabel alloc] init];
    _keyLabel.text = titleName;
    _keyLabel.textAlignment = NSTextAlignmentLeft;
    _keyLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    
    [self addSubview:_keyLabel];
    [self.contentView addSubview:_valueSwitch];

    [_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    [_valueSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self);
    }];
}

- (void) switchAction:(UISwitch *)sender {
    if (sender.on == YES) {
        self.checklist.checkItem = @1;
    } else {
        self.checklist.checkItem = @0;
    }
}

@end
