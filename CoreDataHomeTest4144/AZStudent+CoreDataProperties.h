//
//  AZStudent+CoreDataProperties.h
//  CoreDataHomeTest4144
//
//  Created by My mac on 01.06.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AZStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface AZStudent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;

@end

NS_ASSUME_NONNULL_END
