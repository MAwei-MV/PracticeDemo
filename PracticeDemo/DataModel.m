//
//  DataModel.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "DataModel.h"
#import "Checklist.h"
#import "ChecklistItem.h"
#import "Catalog.h"

@implementation DataModel

- (id)init {
    if ((self = [super init])) {
        [self loadAllData];
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
- (void)loadAllData {
    self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    Catalog *cata;
    Checklist *list;
    cata = [[Catalog alloc] init];
    cata.catalist = [[NSMutableArray alloc] initWithCapacity:20];
    cata.name = @"Function1";
    list = [[Checklist alloc] init];
    list.titleName = @"Switch1";
    list.checkItem = @1;
    [cata.catalist addObject:list];
    
    list = [[Checklist alloc] init];
    list.titleName = @"String";
    list.caption = @"aaa";
    [cata.catalist addObject:list];
    
    list = [[Checklist alloc] init];
    list.items = [[NSMutableArray alloc] init];
    list.titleName = @"DefaultList";
    ChecklistItem *item = [[ChecklistItem alloc] init];
    item.keyText = @"item 1";
    item.valueText = @"B";
    [list.items addObject:item];
    [cata.catalist addObject:list];
    
    Catalog *subCata = [[Catalog alloc] init];
    subCata.name = @"SubFunction";
    subCata.catalist = [[NSMutableArray alloc] initWithCapacity:20];
    list = [[Checklist alloc] init];
    list.titleName = @"item For subCategory";
    list.caption = @"bbbbb";
    [subCata.catalist addObject:list];
    [cata.catalist addObject:subCata];
    
    [_lists addObject:cata];
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
