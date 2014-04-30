//
//  Locations+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Locations+Extra.h"

@implementation Locations (Extra)

+(Locations *)CreateLocationWithCity:(NSString *)city country:(NSString *)country region:(NSString *)region inContext:(NSManagedObjectContext *)context{
    
    Locations *newLocation;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Locations"];
    request.predicate = [NSPredicate predicateWithFormat:@"city = %@ and country = %@ and region = %@", city, country, region];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        //Error looking for the status record.
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newLocation = [NSEntityDescription insertNewObjectForEntityForName:@"Locations" inManagedObjectContext:context];
            
            newLocation.city = city;
            newLocation.country = country;
            newLocation.region = region;
            
        }
        else{
            newLocation = [recordsFound lastObject];
        }
        
    }
    
    return newLocation;
}

@end
