//
//  Locations.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Resources;

@interface Locations : NSManagedObject

@property (nonatomic, retain) NSString * region;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSSet *resources;
@end

@interface Locations (CoreDataGeneratedAccessors)

- (void)addResourcesObject:(Resources *)value;
- (void)removeResourcesObject:(Resources *)value;
- (void)addResources:(NSSet *)values;
- (void)removeResources:(NSSet *)values;

@end
