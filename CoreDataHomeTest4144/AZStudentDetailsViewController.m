//
//  AZStudentDetailsViewController.m
//  CoreDataHomeTest4144
//
//  Created by My mac on 03.06.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//

#import "AZStudentDetailsViewController.h"
#import "AZDataManager.h"


@interface AZStudentDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIButton* saveButton;

@end

@implementation AZStudentDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.studentDataModel) {
        UIBarButtonItem* saveBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(actionClick:)];
        self.navigationItem.rightBarButtonItems = @[saveBarButton];
        
        self.saveButton.titleLabel.text = @"Save";
        [self initFields];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Private Methods

- (void) initFields {
    AZStudentDataModel* model = self.studentDataModel;
    self.firstNameTextField.text = model.firstName;
    self.lastNameTextField.text = model.lastName;
    self.emailTextField.text = model.email;
}

#pragma mark - Actions

- (IBAction)actionClick:(UIButton *)sender {
    AZStudentDataModel* tempStudent = [[AZStudentDataModel alloc] init];
    tempStudent.firstName = self.firstNameTextField.text;
    tempStudent.lastName = self.lastNameTextField.text;
    tempStudent.email = self.emailTextField.text;
    
    self.block(tempStudent);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
