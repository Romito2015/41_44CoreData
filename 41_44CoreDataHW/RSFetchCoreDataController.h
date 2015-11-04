//
//  RSFetchCoreDataController.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 10/29/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSharedManager.h"
@interface RSFetchCoreDataController : UITableViewController <NSFetchedResultsControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
