//
//  ViewController.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <UIKit/UIKit.h>

@class DataModel;

@interface HomepageViewController : UITableViewController<UINavigationControllerDelegate>

@property (strong, nonatomic)DataModel *dataModel;

@end

