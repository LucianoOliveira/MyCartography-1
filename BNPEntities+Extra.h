//
//  BNPEntities+Extra.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "BNPEntities.h"

@interface BNPEntities (Extra)

+ (BNPEntities *)CreateBNPEntityWithEntity:(NSString *)entity inContext:(NSManagedObjectContext *)context;

@end
