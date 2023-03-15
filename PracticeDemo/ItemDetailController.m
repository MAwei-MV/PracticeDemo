//
//  ItemDetailController.m
//  PracticeDemo
//
//  Created by 周婷玉 on 2023/3/15.
//

#import "ItemDetailController.h"

@implementation ItemDetailController
@synthesize label;
@synthesize text;

- (void)viewWillAppear:(BOOL)animated {
    label = [[UILabel alloc] init];
    label.text = text;
    [super viewWillAppear: animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
