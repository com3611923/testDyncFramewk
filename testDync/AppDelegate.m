//
//  AppDelegate.m
//  testDync
//
//  Created by caobin on 16/3/22.
//  Copyright © 2016年 caobin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configDylic];
    
    ViewController *controller = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self.window setRootViewController:navController];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)configDylic
{
    NSString *dyBundlePath = [[NSBundle mainBundle] pathForResource:@"dyncframewk" ofType:@"framework"];
    
    NSString *dylicDir = [NSString stringWithFormat:@"%@/Library/Frame",NSHomeDirectory()];
    if(![[NSFileManager defaultManager] fileExistsAtPath:dylicDir isDirectory:NULL]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dylicDir withIntermediateDirectories:NO attributes:NULL error:nil];
    }
    
    NSError *error = nil;
    BOOL res = [[NSFileManager defaultManager] copyItemAtPath:dyBundlePath toPath:[dylicDir stringByAppendingPathComponent:@"Dylib.framework"] error:&error];
    
}

@end
