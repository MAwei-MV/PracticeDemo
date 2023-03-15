//
//  DataModel.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "DataModel.h"
#import "Checklist.h"
#import "ChecklistItem.h"

@implementation DataModel

- (id)init {
    if ((self = [super init])) {
        [self loadChecklists];
        [self registerDefaults];
    }
    return self;
}

- (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath {
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}

//封
- (void)saveChecklists {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.lists forKey:@"Checklists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];

}

//取
- (void)loadChecklists {
    self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    Checklist *list;
    list = [[Checklist alloc] init];
    list.caption = @"Function1";
    Checklist *subList = [[Checklist alloc] init];
    subList.caption = @"subCategory of First Function1";
    list.subCategory = subList;
    [_lists addObject:list];
    
    list = [[Checklist alloc] init];
    list.caption = @"Function2";
    list.num = @1002;
    [_lists addObject:list];
    
    list = [[Checklist alloc] init];
    list.caption = @"Function3";
    NSDictionary *ns = [[NSDictionary alloc] initWithObjectsAndKeys:@"YES",@"Switch1",@"NO",@"Switch", nil];
    [_lists addObject:list];
    
    list = [[Checklist alloc] init];
    list.caption = @"Function4";
    ChecklistItem *listItem = [[ChecklistItem alloc] init];
    listItem.text = @"I am the Item";
    list.items = [[NSMutableArray alloc] initWithCapacity:5];
    [list.items addObject:listItem];
    [_lists addObject:list];
    
//    NSString *path = [self dataFilePath];
//    NSLog(@"MV make a tag for dataFilePath: %@:", path);
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
//        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//        self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
//        [unarchiver finishDecoding];
//    } else {
//        self.lists = [[NSMutableArray alloc] initWithCapacity:20];
//    }
}

- (void)registerDefaults {
    //use NSUserDefaults to remember which screen was open.
    NSDictionary *dictionary = @{@"ChecklistIndex": @-1};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

- (NSInteger)indexOfSelectedChecklist {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ChecklistIndex"];
}

- (void)setIndexOfSelectedChecklist: (NSInteger)index {
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"ChecklistIndex"];
}

@end
