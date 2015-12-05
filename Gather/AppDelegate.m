//
//  AppDelegate.m
//  Gather
//
//  Created by chen on 11/30/15.
//  Copyright © 2015 chen. All rights reserved.
//

#import "AppDelegate.h"
#import "TabActivityViewController.h"
#import "TabSchoolViewController.h"
#import "TabPostViewController.h"
#import "TabFriendsViewController.h"
#import "TabPersonalViewController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic ,strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    TabActivityViewController *activityController = [[TabActivityViewController alloc] initWithNibName:@"TabActivityViewController" bundle:nil];
    UINavigationController *activityNavigationController = [[UINavigationController alloc] initWithRootViewController:activityController];
//    activityController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    activityController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"活动" image:[UIImage imageNamed:@"home_gray"] selectedImage:[UIImage imageNamed:@"home"]];

    TabSchoolViewController *schoolController = [[TabSchoolViewController alloc] initWithNibName:@"TabSchoolViewController" bundle:nil];
    UINavigationController *schoolNavigationController = [[UINavigationController alloc] initWithRootViewController:schoolController];
//    schoolController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    schoolController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"学校" image:[UIImage imageNamed:@"school_gray"] selectedImage:[UIImage imageNamed:@"school"]];
    
//    TabPostViewController *postController = [[TabPostViewController alloc] initWithNibName:@"TabPostViewController" bundle:nil];
//    UINavigationController *postNavigationController = [[UINavigationController alloc] initWithRootViewController:postController];
//    postController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];
    
    TabFriendsViewController *friendsController = [[TabFriendsViewController alloc] initWithNibName:@"TabFriendsViewController" bundle:nil];
    UINavigationController *friendsNavigationController = [[UINavigationController alloc] initWithRootViewController:friendsController];
//    friendsController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:4];
    friendsController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"chat_gray"] selectedImage:[UIImage imageNamed:@"chat"]];
    
    TabPersonalViewController *personalController = [[TabPersonalViewController alloc] initWithNibName:@"TabPersonalViewController" bundle:nil];
    UINavigationController *personalNavigationController = [[UINavigationController alloc] initWithRootViewController:personalController];
//    personalController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:5];
    personalController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人" image:[UIImage imageNamed:@"personal_gray"] selectedImage:[UIImage imageNamed:@"personal"]];
    
    
    NSArray *controllerArray = [NSArray arrayWithObjects:activityNavigationController, schoolNavigationController, friendsNavigationController, personalNavigationController, nil];
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = controllerArray;
    _tabBarController.delegate = self;

    self.window.rootViewController = _tabBarController;
    [self.window makeKeyAndVisible];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
