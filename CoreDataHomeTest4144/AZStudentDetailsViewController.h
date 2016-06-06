//
//  AZStudentDetailsViewController.h
//  CoreDataHomeTest4144
//
//  Created by My mac on 03.06.16.
//  Copyright © 2016 Anatolii Zavialov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZStudent.h"
#import "AZStudentDataModel.h"

typedef void(^StudentBlock) (AZStudentDataModel*);

@interface AZStudentDetailsViewController : UIViewController

@property (copy, nonatomic) StudentBlock block;
@property (strong, nonatomic) AZStudentDataModel* studentDataModel;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)actionClick:(UIButton *)sender;

@end
