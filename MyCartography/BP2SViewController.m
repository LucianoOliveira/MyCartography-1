//
//  BP2SViewController.m
//  MyCartography
//
//  Created by Rui Cardoso on 28/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "BP2SViewController.h"
#import "BP2S_availableOptionsViewController.h"
#import "BP2S_selectedCriteriaViewController.h"

@interface BP2SViewController ()

@end

@implementation BP2SViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showAvailableOptions"]) {
        BP2S_availableOptionsViewController *availableOptionsController = (BP2S_availableOptionsViewController *)segue.destinationViewController;
        [availableOptionsController setManagedObjectContext:_managedObjectContext];
    }
    else if ([segue.identifier isEqualToString:@"showSelectedCriteria"]){
    
    }
}
@end
