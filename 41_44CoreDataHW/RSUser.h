//
//  RSUser.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/3/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RSCourse;

@interface RSUser : NSManagedObject

@property (nonatomic, retain) NSString * emailAddress;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * teacher;
@property (nonatomic, retain) NSSet *coursesToProfess;
@property (nonatomic, retain) NSSet *coursesToStudy;
@end

@interface RSUser (CoreDataGeneratedAccessors)

- (void)addCoursesToProfessObject:(RSCourse *)value;
- (void)removeCoursesToProfessObject:(RSCourse *)value;
- (void)addCoursesToProfess:(NSSet *)values;
- (void)removeCoursesToProfess:(NSSet *)values;

- (void)addCoursesToStudyObject:(RSCourse *)value;
- (void)removeCoursesToStudyObject:(RSCourse *)value;
- (void)addCoursesToStudy:(NSSet *)values;
- (void)removeCoursesToStudy:(NSSet *)values;

@end
