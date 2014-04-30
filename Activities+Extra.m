//
//  Activities+Extra.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Activities+Extra.h"

@implementation Activities (Extra)

+(Activities *)CreateActivityWithCategory:(NSString *)category subCategory:(NSString *)subCategory businessLine:(NSString *)businessLine inContext:(NSManagedObjectContext *)context{
    
    Activities *newActivity;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Activities"];
    request.predicate = [NSPredicate predicateWithFormat:@"businessLine = %@ and category = %@ and subCategory = %@", businessLine, category, subCategory];
    
    NSError *error = nil;
    
    NSArray *recordsFound = [context executeFetchRequest:request error:&error];
    
    if (error) {
        //Error looking for the status record.
        NSLog(@"Error: %@",error.userInfo);
    }
    else{
        if ([recordsFound count] == 0) {
            newActivity = [NSEntityDescription insertNewObjectForEntityForName:@"Activities" inManagedObjectContext:context];
            
            newActivity.businessLine = businessLine;
            newActivity.category = category;
            newActivity.subCategory = subCategory;
            
        }
        else{
            newActivity = [recordsFound lastObject];
        }
        
    }
    
    return newActivity;
}

@end
