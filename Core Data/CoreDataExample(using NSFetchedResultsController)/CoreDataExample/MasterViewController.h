//
//  MasterViewController.h
//  CoreDataExample
//
//  Created by Wild Yaoyao on 7/24/14.
//  Copyright (c) 2014 Wild Yaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, strong) NSArray *failedBankInfos;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
