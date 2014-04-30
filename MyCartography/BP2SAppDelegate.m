//
//  BP2SAppDelegate.m
//  MyCartography
//
//  Created by Rui Cardoso on 28/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//
#import "NSString+converterCSV.h"
#import "Resources+Extra.h"
#import "BP2SAppDelegate.h"
#import "Resources.h"
#import "BP2SViewController.h"

@implementation BP2SAppDelegate

//Core Data Stack
- (NSManagedObjectContext *) managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return _managedObjectContext;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES],
                             NSInferMappingModelAutomaticallyOption,
                             @{ @"journal_mode" : @"DELETE" },
                             NSSQLitePragmasOption,
                             nil];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"MyCartography.MStore"];
    
    NSError *error;
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        NSLog(@"Error creating storeCoordinator: %@",error.userInfo);
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModel;
}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //Creates core data stack
    _managedObjectContext = [self managedObjectContext];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *DBCreated = [userDefaults objectForKey:@"DBCreated"];
    
    if (!DBCreated) {
        [self populateDB];
        [userDefaults setObject:[NSNumber numberWithBool:YES] forKey:@"DBCreated"];
        [userDefaults synchronize];
    }
    else{
        //DB already created. Nothing to do.
        //Can do updates here.
    }

    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

    BP2SViewController *rootViewController = [myStoryBoard instantiateInitialViewController];
    
    [rootViewController setManagedObjectContext:_managedObjectContext];
    
    return YES;
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

-(void)populateDB{
    NSError *error;
    
    NSURL *DBURL = [[NSBundle mainBundle] URLForResource:@"Resources" withExtension:@"csv"];
    
    NSString *DBString = [NSString stringWithContentsOfURL:DBURL encoding:NSISOLatin1StringEncoding error:&error];
    
    if (error) {
        NSLog(@"Error extracting data: %@",error.userInfo);
    }
    else{
        NSArray *DBArray = [DBString csvRows];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterNoStyle];
        
        for(NSArray *individualArray in DBArray){
            
            NSNumber *resourceID = [formatter numberFromString:[individualArray objectAtIndex:0]];
            NSString *city = [individualArray objectAtIndex:1];
            NSString *country = [individualArray objectAtIndex:2];
            NSString *region = [individualArray objectAtIndex:3];
            NSString *role = [individualArray objectAtIndex:4];
            NSString *subCategory = [individualArray objectAtIndex:5];
            NSString *category = [individualArray objectAtIndex:6];
            NSString *businessLine = [individualArray objectAtIndex:7];
            NSString *status = [individualArray objectAtIndex:8];
            NSString *globalStatus = [individualArray objectAtIndex:9];
            NSString *bnpEntity = [individualArray objectAtIndex:10];
            
            Resources *newResource = [Resources CreateResourceWithID:resourceID City:city Country:country Region:region Role:role SubCategory:subCategory Category:category BusinessLine:businessLine Status:status GlobalStatus:globalStatus entity:bnpEntity context:_managedObjectContext];
            
            NSLog(@"ResourceID:%@",newResource.resourceID);
            
        }
    }
}

@end
