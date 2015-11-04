//
//  RSCreateUserController.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 10/26/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSharedManager.h"
#import "RSUser.h"

typedef enum {
    
    RSUserTypeStudent = 0,
    RSUserTypeTeacher = 1
    
} RSUserType;

@interface RSCreateUserController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) RSUser *user;

- (IBAction)buttonSave:(UIBarButtonItem *)sender;

@end
