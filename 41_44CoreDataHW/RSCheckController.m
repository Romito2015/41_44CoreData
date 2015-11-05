//
//  RSCheckController.m
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/5/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSCheckController.h"

@interface RSCheckController ()

@end

@implementation RSCheckController
@synthesize fetchedResultsController = _fetchedResultsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setFetchEtityClass:(id)fetchEtityClass {
    
    if (self.dataType == RSDataTypeStudent || self.dataType == RSDataTypeTeacher) {
        
        if (_fetchEtityClass != fetchEtityClass) {
            _fetchEtityClass = (RSUser *)fetchEtityClass;
        }
    
    } else if (self.dataType == RSDataTypeCourse) {
        
        if (_fetchEtityClass != fetchEtityClass) {
            _fetchEtityClass = (RSCourse *)fetchEtityClass;
        }
    }
}



#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    
    NSEntityDescription *entity = nil;
    
    
    if (self.dataType == RSDataTypeStudent || self.dataType == RSDataTypeTeacher) {
        
        entity = [NSEntityDescription entityForName:@"RSUser" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
    } else if (self.dataType == RSDataTypeCourse) {
        
        entity = [NSEntityDescription entityForName:@"RSCourse" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
    }
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"teacher == %d", RSDataTypeStudent];
    
    [fetchRequest setPredicate:predicate];

    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    
    NSSortDescriptor *sortDescriptor = nil;
    
    if (self.dataType == RSDataTypeStudent || self.dataType == RSDataTypeTeacher) {
        
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
        
    } else if (self.dataType == RSDataTypeCourse) {
        
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nameOfTheCourse" ascending:YES];
    }
    
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                managedObjectContext:self.managedObjectContext
                                                                                                  sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDataSource

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.dataType == RSDataTypeStudent || self.dataType == RSDataTypeTeacher) {
        
        RSUser *user = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
        
    } else if (self.dataType == RSDataTypeCourse) {
        
        RSCourse *course = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", course.nameOfTheCourse];
        
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
