//
//  RSCreateUserController.m
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 10/26/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSCreateUserController.h"


@interface RSCreateUserController () 

@property (strong, nonatomic) UISegmentedControl *segmentedUserType;
@property (strong, nonatomic) NSArray *arrayOfTextFields;
@property (assign, nonatomic) BOOL tempUserType;

@end

@implementation RSCreateUserController

static NSString *textFieldPlaceholders[] = {@"First name", @"Last name", @"E-mail address"};
static int numberofPlaceholders = 3;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarItem.title = @"New User";

    // Do any additional setup after loading the view.
    
    NSMutableArray * tempTextFields = [NSMutableArray array];
    for (int i = 0; i < numberofPlaceholders; i++) {
        [tempTextFields addObject:[self createTextFieldForRow:i]];
    }
    
    self.arrayOfTextFields = tempTextFields;

}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numberofPlaceholders;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return numberofPlaceholders +1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 5;//[self.user.coursesToStudy count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier =@"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    if (indexPath.section == 0 & indexPath.row < numberofPlaceholders) {
        
        UITextField *textField = [self.arrayOfTextFields objectAtIndex:indexPath.row];
        
        if (self.user) {
            
            if (textField.tag == 0) {
                
                textField.text = self.user.firstName;
                
            } else if (textField.tag == 1) {
                
                textField.text = self.user.lastName;
                
                
            } else if (textField.tag == 2) {
                
                textField.text = self.user.emailAddress;
                
            }
        }
        
        
        [cell addSubview:textField];
    } else if (indexPath.section == 0 & indexPath.row == numberofPlaceholders) {
        
        [self createSegmentedControl];
        [cell addSubview:self.segmentedUserType];
        
    } else if (indexPath.section == 1 & indexPath.row == 0) {
        
        cell.textLabel.text = @"Add course";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor greenColor];
        
    } else if (indexPath.section == 2 ) {
        
        cell.textLabel.text = @"Course will be here";
    }
    
    return cell;
}


#pragma mark - Actions

-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0:{
            self.tempUserType = RSUserTypeStudent;
            break;}
        case 1:{
            self.tempUserType = RSUserTypeTeacher;
            break;}
    }
}

- (IBAction)buttonSave:(UIBarButtonItem *)sender {
    
    if (!self.user) {
        self.user = [NSEntityDescription insertNewObjectForEntityForName:@"RSUser"
                                                  inManagedObjectContext:[RSSharedManager sharedManager].managedObjectContext];
        
    }
    
        for (UITextField *textField in self.arrayOfTextFields) {
            
            if (textField.tag == 0) {
                self.user.firstName = textField.text;
            } else if (textField.tag == 1) {
                self.user.lastName = textField.text;
            } else if (textField.tag == 2) {
                self.user.emailAddress = textField.text;
            }
        }
    
    self.user.teacher = @(self.tempUserType);
    
    
    
    NSError *error = nil;
    
    if (![[RSSharedManager sharedManager].managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
        
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

- (void) createSegmentedControl {
    
    NSArray *segmentedItems = @[@"Student", @"Professor"];
    
    self.segmentedUserType = [[UISegmentedControl alloc] initWithItems:segmentedItems];
    self.segmentedUserType.frame = CGRectMake(20,7, 280, 30);
    self.segmentedUserType.selectedSegmentIndex = self.user.teacher ? [self.user.teacher boolValue] : RSUserTypeStudent;
    [self.segmentedUserType addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
