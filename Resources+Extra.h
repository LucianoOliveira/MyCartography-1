//
//  Resources+Extra.h
//  MyCartography
//
//  Created by Rui Cardoso on 28/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Resources.h"

@interface Resources (Extra)

+(Resources *)CreateResourceWithID:(NSNumber *)idResource City:(NSString *)city Country:(NSString *)country Region:(NSString *)region Role:(NSString *)role SubCategory:(NSString *)subCateogry Category:(NSString *)category BusinessLine:(NSString *)businessLine Status:(NSString *)status GlobalStatus:(NSString *)globalStatus entity:(NSString *)bnpEntity context:(NSManagedObjectContext *)context;
@end
