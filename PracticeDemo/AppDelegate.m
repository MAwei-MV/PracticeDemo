//
//  AppDelegate.m
//  PracticeDemo
//
//  Created by mawei on 2023/3/15.
//

#import "AppDelegate.h"
#import "HomepageViewController.h"
#import "DataModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    HomepageViewController *rootViewController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomepageViewController *vc = [HomepageViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    //vc.view.backgroundColor = [UIColor whiteColor];
    rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    DataModel *nowDataModel = [rootViewController dataModel];
    [nowDataModel saveChecklists];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    DataModel *nowDataModel = [rootViewController dataModel];
    [nowDataModel saveChecklists];
}

@end
