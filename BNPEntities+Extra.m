//
//  BNPEntities+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "BNPEntities+Extra.h"

@implementation BNPEntities (Extra)

+ (BNPEntities *)CreateBNPEntityWithEntity:(NSString *)entity inContext:(NSManagedObjectContext *)context{
   
    BNPEntities *newEntity;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"BNPEntities"];
    request.predicate = [NSPredicate predicateWithFormat:@"bnpEntity = %@", entity];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        //Error looking for the status record.
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newEntity = [NSEntityDescription insertNewObjectForEntityForName:@"BNPEntities" inManagedObjectContext:context];
            
            newEntity.bnpEntity = entity;
        }
        else{
            newEntity = [recordsFound lastObject];
        }
        
    }
    
    return newEntity;
}

@end
