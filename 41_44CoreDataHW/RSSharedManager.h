//
//  RSSharedManager.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 10/27/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSharedManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
+ (RSSharedManager *) sharedManager;
@end
