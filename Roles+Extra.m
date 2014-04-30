//
//  Roles+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Roles+Extra.h"

@implementation Roles (Extra)

+(Roles *)CreateRoleWithRole:(NSString *)role inContext:(NSManagedObjectContext *)context{
   
    Roles *newRole;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Roles"];
    request.predicate = [NSPredicate predicateWithFormat:@"role = %@", role];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        //Error looking for the status record.
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newRole = [NSEntityDescription insertNewObjectForEntityForName:@"Roles" inManagedObjectContext:context];
            
            newRole.role = role;
            
        }
        else{
            newRole = [recordsFound lastObject];
        }
        
    }
    return newRole;
}

@end
