//
//  AZStudent+CoreDataProperties.h
//  CoreDataHomeTest4144
//
//  Created by My mac on 30.05.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AZStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface AZStudent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *email;

@end

NS_ASSUME_NONNULL_END
