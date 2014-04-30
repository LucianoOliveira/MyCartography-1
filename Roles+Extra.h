//
//  Roles+Extra.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "Roles.h"

@interface Roles (Extra)

+(Roles *)CreateRoleWithRole:(NSString *)role inContext:(NSManagedObjectContext *)context;
@end
