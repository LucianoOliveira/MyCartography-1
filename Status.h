//
//  Status.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Resources;

@interface Status : NSManagedObject

@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * globalStatus;
@property (nonatomic, retain) NSSet *resources;
@end

@interface Status (CoreDataGeneratedAccessors)

- (void)addResourcesObject:(Resources *)value;
- (void)removeResourcesObject:(Resources *)value;
- (void)addResources:(NSSet *)values;
- (void)removeResources:(NSSet *)values;

@end
