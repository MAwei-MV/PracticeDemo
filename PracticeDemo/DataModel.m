//
//  DataModel.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "DataModel.h"
#import "Checklist.h"
#import "Catalog.h"
#import "ChecklistItem.h"

@implementation DataModel

- (id)init {
    if ((self = [super init])) {
        [self loadAllData];
        [self registerDefaults];
    }
    return self;
}

- (NSString *)documentsDirectory {
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths firstObject];
    //return documentsDirectory;
    return @"/Users/tingyu/Desktop";
}

- (NSString *)dataFilePath {
    return [[self documentsDirectory] stringByAppendingPathComponent:@"PropertyList.plist"];
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
//序列化方案
- (void)loadAllData {
    self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        self.lists = [[NSMutableArray alloc] init];
        NSDictionary *catalogs = [NSDictionary dictionaryWithContentsOfFile:path];
        for (NSString *keyName in catalogs) {
            Catalog *catalog = [self recuLoadData:catalogs[keyName]];
            catalog.name = keyName;
            [self.lists addObject:catalog];
        }
    } else {
        self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    }
}
//递归加载
- (Catalog *)recuLoadData: (NSDictionary *) dic{
    Catalog *catalog = [[Catalog alloc] init];
    NSMutableArray *lists = [[NSMutableArray alloc] init];
    for (NSString *keyName in dic) {
        Checklist *list = [[Checklist alloc] init];
        list.titleName = keyName;
        //二级分类时
        if ([dic[keyName] isKindOfClass:NSDictionary.class]) {
            Catalog *subCata = [self recuLoadData:dic[keyName]];
            subCata.name = keyName;
            list.subCategory = subCata;
        } else if ([dic[keyName] isKindOfClass:NSArray.class]) {
            NSMutableArray *valueTexts = dic[keyName];
            int index = 0;
            NSMutableArray *checkItems = [[NSMutableArray alloc] init];
            for (NSString *valueText in valueTexts) {
                ChecklistItem *item = [[ChecklistItem alloc] init];
                item.keyText = [@"Item " stringByAppendingString: [NSString stringWithFormat:@"%d", index]];
                item.valueText = valueText;
                [checkItems addObject:item];
                index += 1;
            }
            list.items = checkItems;
        } else if ([dic[keyName] isKindOfClass:NSString.class]) {
                list.caption = dic[keyName];
        } else if ([dic[keyName] isKindOfClass:NSNumber.class]){
            NSNumber *number = dic[keyName];
            if ([number isEqual: @NO] || [number isEqual: @YES]) {
                list.checkItem = number;
            } else {
                list.num = number;
            }
        }
        [lists addObject:list];
    }
    catalog.catalist = lists;
    return catalog;
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


- (void)sortCatalog {
    [self.lists sortUsingSelector:@selector(compare:)];
}

@end
