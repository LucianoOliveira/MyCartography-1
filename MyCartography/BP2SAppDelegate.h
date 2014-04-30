//
//  BP2SAppDelegate.h
//  MyCartography
//
//  Created by Rui Cardoso on 28/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BP2SAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
