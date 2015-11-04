//
//  RSCourse.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/3/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RSUser;

@interface RSCourse : NSManagedObject

@property (nonatomic, retain) NSString * branch;
@property (nonatomic, retain) NSString * nameOfTheCourse;
@property (nonatomic, retain) NSString * subject;
@property (nonatomic, retain) RSUser *professors;
@property (nonatomic, retain) NSSet *students;
@end

@interface RSCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(RSUser *)value;
- (void)removeStudentsObject:(RSUser *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
