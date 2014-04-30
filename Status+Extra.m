//
//  Status+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Status+Extra.h"

@implementation Status (Extra)

+(Status *)CreateStatusRecordWithStatus:(NSString *)status andGlobalStatus:(NSString *)globalStatus inContext:(NSManagedObjectContext *)context
{
    Status *newStatus;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Status"];
    request.predicate = [NSPredicate predicateWithFormat:@"status = %@ and globalStatus = %@", status, globalStatus];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        //Error looking for the status record.
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newStatus = [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];
            
            newStatus.status = status;
            newStatus.globalStatus = globalStatus;
        }
        else{
            newStatus = [recordsFound lastObject];
        }
    
    }
    
    return newStatus;
}

@end
