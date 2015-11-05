//
//  RSCheckController.h
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 11/5/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSFetchCoreDataController.h"
#import "RSUser.h"
#import "RSCourse.h"

@interface RSCheckController : RSFetchCoreDataController

@property (assign, nonatomic) RSDataType dataType;
@property (strong, nonatomic) id fetchEtityClass;

@end
