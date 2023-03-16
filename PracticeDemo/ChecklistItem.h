//
//  ChecklistItem.h
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject <NSCoding>

@property (nonatomic, strong) NSString *keyText;
@property (nonatomic, strong) NSString *valueText;

@end
