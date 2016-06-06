//
//  AZStudentsViewController.m
//  CoreDataHomeTest4144
//
//  Created by My mac on 01.06.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//

#import "AZStudentsViewController.h"
#import "AZStudent.h"
#import "AZDataManager.h"
#import "AZStudentDetailsViewController.h"
#import "AZStudentDataModel.h"

@interface AZStudentsViewController ()

@property(strong, nonatomic) AZStudent* tempStudent;

@end

@implementation AZStudentsViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Students";
    
    UIBarButtonItem* rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];
    self.navigationItem.rightBarButtonItems = @[rightBarButton];
    
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void) saveObjectWithDataModel:(AZStudentDataModel*) studentModel {
    //NSManagedObjectContext* context = [self.fetchedResultsController managedObjectContext];
    AZStudent* tempStudent;
    if (self.tempStudent) {
        tempStudent = self.tempStudent;
        self.tempStudent = nil;
    } else {
        tempStudent = [NSEntityDescription insertNewObjectForEntityForName:@"AZStudent" inManagedObjectContext:self.managedObjectContext];
    }
    
    tempStudent.firstName = studentModel.firstName;
    tempStudent.lastName = studentModel.lastName;
    tempStudent.email = studentModel.email;
    
    NSError* error = nil;
    
    [self.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"ERROR!!!! %@", error.localizedDescription);
    }
    
}

- (id) getViewControllerWithClassName:(NSString*) className {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* view = [storyboard instantiateViewControllerWithIdentifier:className];
    
    return view;
}

#pragma mark - Actions 

- (void) actionAdd:(UIBarButtonItem*) button {
    
    AZStudentDetailsViewController* vc = [self getViewControllerWithClassName:NSStringFromClass([AZStudentDetailsViewController class])];
    
    void(^studentBlock)(AZStudentDataModel*) = ^(AZStudentDataModel* student) {
        [self saveObjectWithDataModel:student];
    };
    
    vc.block = studentBlock;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AZStudent* student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    self.tempStudent = student;
    
    AZStudentDataModel* studentDomainModel = [[AZStudentDataModel alloc] init];
    studentDomainModel.firstName = student.firstName;
    studentDomainModel.lastName = student.lastName;
    studentDomainModel.email = student.email;
    
    
    AZStudentDetailsViewController* vc = [self getViewControllerWithClassName:NSStringFromClass([AZStudentDetailsViewController class])];
    void(^studentBlock)(AZStudentDataModel*) = ^(AZStudentDataModel* student) {
        [self saveObjectWithDataModel:student];
    };
    
    vc.block = studentBlock;
    vc.studentDataModel = studentDomainModel;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
