//
//  Resources.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activities, BNPEntities, Locations, Roles, Status;

@interface Resources : NSManagedObject

@property (nonatomic, retain) NSNumber * resourceID;
@property (nonatomic, retain) BNPEntities *bnpEntity;
@property (nonatomic, retain) Activities *activity;
@property (nonatomic, retain) Locations *location;
@property (nonatomic, retain) Roles *role;
@property (nonatomic, retain) Status *status;

@end
