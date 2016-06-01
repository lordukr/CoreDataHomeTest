//
//  AZCoreDataManager.h
//  CoreDataHomeTest4144
//
//  Created by My mac on 30.05.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"
#import "AZStudent.h"

@interface AZDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void) saveContext;

- (NSURL *)applicationDocumentsDirectory;

+ (AZDataManager*) sharedManager;
- (AZStudent*) addRandomStudent;

@end
