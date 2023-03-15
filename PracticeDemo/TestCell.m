//
//  TestCell.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 130, 120, 40)];
    label.backgroundColor = UIColor.orangeColor;
    label.text = @"111";
}

@end
