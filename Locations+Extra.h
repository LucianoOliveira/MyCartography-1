//
//  Locations+Extra.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Locations.h"

@interface Locations (Extra)

+(Locations *)CreateLocationWithCity:(NSString *)city country:(NSString *)country region:(NSString *)region inContext:(NSManagedObjectContext *)context;
@end
