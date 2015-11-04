//
//  RSCreateCourseController.m
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/3/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSCreateCourseController.h"

@interface RSCreateCourseController ()

@property (strong, nonatomic) NSArray *arrayOfTextFields;
@property (strong, nonatomic) NSArray *studentsDataArray;

@end

@implementation RSCreateCourseController

@synthesize fetchedResultsController = _fetchedResultsController;


static NSString *textFieldPlaceholders[] = {@"Name of the Course", @"Subject", @"Branch"};
static int numberofPlaceholders = 3;



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Create course";
    // Do any additional setup after loading the view.
    
    NSMutableArray * tempTextFields = [NSMutableArray array];
    for (int i = 0; i < numberofPlaceholders; i++) {
        [tempTextFields addObject:[self createTextFieldForRow:i]];
    }
    
    self.arrayOfTextFields = tempTextFields;
    
    
    if (self.course != nil) {
        //self.nameTextField.text = self.course.name;
        //self.subjectTextField.text = self.course.subject;
        //self.departmentTextField.text = self.course.department;
        
    } else {
        self.course = [NSEntityDescription insertNewObjectForEntityForName:@"RSCourse" inManagedObjectContext:[[RSSharedManager sharedManager] managedObjectContext]];
    }
    
    
    
    self.studentsDataArray = [NSArray array];
    self.studentsDataArray = [[self.course students] allObjects];
    
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RSCourse" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *courseNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nameOfTheCourse" ascending:YES];
    
    
    NSArray *sortDescriptors = @[courseNameSortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
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


#pragma mark - UITableViewDataSourse


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self.fetchedResultsController sections] count] + 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return numberofPlaceholders;
        
    } else if (section == 1) {
        
        return 1;
        
    } else if (section == 2) {
        
        return [self.studentsDataArray count];
        
    }
    
    return 0;
}

- (void) configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0 & indexPath.row < numberofPlaceholders) {
        
        UITextField *textField = [self.arrayOfTextFields objectAtIndex:indexPath.row];
        
        if (self.course) {
            
            if (textField.tag == 0) {
                
                textField.text = self.course.nameOfTheCourse;
                
            } else if (textField.tag == 1) {
                
                textField.text = self.course.subject;
                
                
            } else if (textField.tag == 2) {
                
                textField.text = self.course.branch;
                
            }
        }
        
        
        [cell addSubview:textField];
        
    } else if (indexPath.section == 1 & indexPath.row == 0) {
        
        cell.textLabel.text = @"Add student";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor yellowColor];
        
    } else if (indexPath.section == 2 ) {
        
        cell.textLabel.text = @"User will be here";
    }

    
    
    
    
    if ([self.studentsDataArray count] != 0) {
        
        RSUser *user = [self.studentsDataArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",user.firstName, user.lastName];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    
    
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 0) {
        
        [[self.arrayOfTextFields objectAtIndex:1] becomeFirstResponder];
        
    } else if (textField.tag == 1) {
        
        [[self.arrayOfTextFields objectAtIndex:2] becomeFirstResponder];
        
    } else if (textField.tag == 2) {
        
        [textField resignFirstResponder];
    }
    
    return YES;
    
}

#pragma mark - create elements methods

- (UITextField *) createTextFieldForRow:(NSInteger)row {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyNext;
    textField.frame = CGRectMake(20,7, 280, 30);
    textField.placeholder = textFieldPlaceholders[row];
    textField.tag = row;
    textField.delegate = self;
    return textField;
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
