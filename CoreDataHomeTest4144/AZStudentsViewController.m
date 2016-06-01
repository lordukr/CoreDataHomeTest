//
//  AZStudentsViewController.m
//  CoreDataHomeTest4144
//
//  Created by My mac on 01.06.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//

#import "AZStudentsViewController.h"
#import "AZStudent.h"

@interface AZStudentsViewController ()

@end

@implementation AZStudentsViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Students";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSFetchRequest* fetchrequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"AZStudent" inManagedObjectContext:self.managedObjectContext];
    
    [fetchrequest setEntity:description];
    
    NSSortDescriptor* firstNameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    NSSortDescriptor* lastNameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    
    [fetchrequest setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
    
    NSFetchedResultsController* fetchedResultController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchrequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Students"];
    fetchedResultController.delegate = self;
    self.fetchedResultsController = fetchedResultController;
    
    NSError* error = nil;
    
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    }
    return _fetchedResultsController;
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    AZStudent* student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    
}

@end
