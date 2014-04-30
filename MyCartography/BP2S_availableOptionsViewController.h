//
//  BP2S_availableOptionsViewController.h
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BP2S_availableOptionsViewController;

@protocol availableOptionsProtocol <NSObject>

-(void)setSelectedCriteriaName:(NSString *)criteria atLevel:(NSNumber *)level;

@end

@interface BP2S_availableOptionsViewController : UICollectionViewController

//Passed parameters
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) id <availableOptionsProtocol> delegate;
@end
