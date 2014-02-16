//
//  RITAppDelegate.m
//  15BitsTestHW02
//
//  Created by Pronin Alexander on 16.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITAppDelegate.h"
#import "RITStudent.h"

@implementation RITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSMutableArray* students        = [NSMutableArray array];
    NSMutableArray* humanities      = [NSMutableArray array];
    NSMutableArray* nonHumanities   = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        
        NSInteger categories = 0;
        
        for (int j = 0; j < 25; j++) {
            categories = categories | (arc4random() % 2 << j);
        }
        
        switch (arc4random() % 2) {
            case 0:
                // leaving only humanities sciences
                categories = categories & RITScienceDivideHumatinies;
                break;
                
            case 1:
                // leavin onle non humanities sciences
                categories = categories & RITScienceDivideNonHumanities;
                break;
                
        }
        
        RITStudent* student = [RITStudent
                               studentWithName:[NSString stringWithFormat:@"Student%02d", i + 1]
                               andSciencesCategories:categories];
        
        [students addObject:student];
    };
    
    NSInteger developersCount = 0;
    
    for (RITStudent* student in students) {
        if (student.sciencesCategories & RITScienceDivideHumatinies) {
            [humanities addObject:student];
        } else if (student.sciencesCategories & RITScienceDivideNonHumanities) {
            [nonHumanities addObject:student];
        }
        
        if (student.sciencesCategories & RITScienceDivideSoftwareDevelopers) {
            developersCount++;
        }
    }
    
    NSLog(@"-----------------------------------Humanities-----------------------------------");
    NSLog(@"%@", humanities);
    for (RITStudent* student in humanities) {
        NSLog(@"Binary: %@", [self binaryStringWithInteger02:student.sciencesCategories]);
        NSLog(@"%@", [student getSciencesCategories]);
        NSLog(@"\n");
    }
    
    NSLog(@"-----------------------------------NonHumanities--------------------------------");
    NSLog(@"%@", nonHumanities);
    for (RITStudent* student in nonHumanities) {
        NSLog(@"Binary: %@", [self binaryStringWithInteger02:student.sciencesCategories]);
        NSLog(@"%@", [student getSciencesCategories]);
        NSLog(@"\n");
    }
    
    NSLog(@"Developers count: %d", developersCount);
    
    return YES;
}

- (NSString*) binaryStringWithInteger02:(NSInteger) value {
    NSMutableString*    string = [NSMutableString string];
    
    for (int i = sizeof(value)*8 - 1; i >= 0; i--) {
        [string appendString:(value >> i) & 1 ? @"1" : @"0"];
        [string appendString:(i % 4) ? @"" : @" " ];
    }
    return string;
}

- (NSString*) binaryStringWithInteger01:(NSInteger) value {
    NSMutableString*    string = [NSMutableString string];
    while (value) {
        [string insertString:(value & 1) ? @"1" : @"0" atIndex:0];
        value = value >> 1;
    }
    return string;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
