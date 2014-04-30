//
//  Status+Extra.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Status.h"

@interface Status (Extra)
+(Status *)CreateStatusRecordWithStatus:(NSString *)status andGlobalStatus:(NSString *)globalStatus inContext:(NSManagedObjectContext *)context;


@end
