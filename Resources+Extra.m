//
//  Resources+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 28/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Resources+Extra.h"
#import "Status+Extra.h"
#import "BNPEntities+Extra.h"
#import "Activities+Extra.h"
#import "Roles+Extra.h"
#import "Locations+Extra.h"

@implementation Resources (Extra)

+(Resources *)CreateResourceWithID:(NSNumber *)idResource City:(NSString *)city Country:(NSString *)country Region:(NSString *)region Role:(NSString *)role SubCategory:(NSString *)subCateogry Category:(NSString *)category BusinessLine:(NSString *)businessLine Status:(NSString *)status GlobalStatus:(NSString *)globalStatus entity:(NSString *)bnpEntity context:(NSManagedObjectContext *)context{
    
    Resources *newResource;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Resources"];
    request.predicate = [NSPredicate predicateWithFormat:@"resourceID = %@", idResource];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newResource = [NSEntityDescription insertNewObjectForEntityForName:@"Resources" inManagedObjectContext:context];
            
            newResource.resourceID = idResource;
            
            Locations *location = [Locations CreateLocationWithCity:city country:country region:region inContext:context];
            
            [newResource setLocation:location];
            
            Roles *resourceRole = [Roles CreateRoleWithRole:role inContext:context];
            [newResource setRole:resourceRole];
            
            
            Activities *resourceActivity = [Activities CreateActivityWithCategory:category subCategory:subCateogry businessLine:businessLine inContext:context];
            [newResource setActivity:resourceActivity];
            
            Status *resourceStatus = [Status CreateStatusRecordWithStatus:status andGlobalStatus:globalStatus inContext:context];
            [newResource setStatus:resourceStatus];
            
            BNPEntities *resourceEntity = [BNPEntities CreateBNPEntityWithEntity:bnpEntity inContext:context];
            
            [newResource setBnpEntity:resourceEntity];
            
        }
        else{
            newResource = [recordsFound lastObject];
        }
    }

    
    return newResource;
}

@end
