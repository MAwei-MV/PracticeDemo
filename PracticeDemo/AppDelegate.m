//
//  AppDelegate.m
//  PracticeDemo
//
//  Created by 周婷玉 on 2023/3/15.
//

#import "AppDelegate.h"
#import "HomepageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomepageViewController *vc = [HomepageViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
