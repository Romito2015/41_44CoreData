//
//  RSCreateCourseController.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/3/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSFetchCoreDataController.h"
#import "RSCourse.h"
#import "RSUser.h"

@interface RSCreateCourseController : RSFetchCoreDataController

@property (strong ,nonatomic) RSCourse *course;

@end
