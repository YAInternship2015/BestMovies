//
//  SANAddMovieViewController.m
//  BestMovies
//
//  Created by Admin on 20.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANAddMovieViewController.h"
#import "SANInputModelValidator.h"
#import "SANDataSource.h"

@interface SANAddMovieViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *addNameField;
@property (nonatomic, strong) SANInputModelValidator *validator;
@property (nonatomic, strong) SANDataSource *dataSource;

@end

@implementation SANAddMovieViewController

- (void)setDataSource:(SANDataSource *)dataSource {
    _dataSource = dataSource;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.validator = [SANInputModelValidator new];
    [self.addNameField becomeFirstResponder];
}

#pragma mark - Methods

- (void)validationInputText {
    NSError *error = nil;
    
    BOOL validationResult = [self.validator isValidModelTitle:self.addNameField.text error:&error];
    if (!validationResult) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error localizedDescription]
                                                            message:[error localizedFailureReason]
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                                  otherButtonTitles:nil];
        [alertView show];
    } else {
        [self saveData];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)saveData {
    NSInteger randomValue = arc4random_uniform(9) + 1;
    NSString *randomImagePath = [NSString stringWithFormat:@"%ld.jpg", (long)randomValue];
    
    [self.dataSource addModelWithImagePath:randomImagePath name:self.addNameField.text];
}

#pragma mark - Actions

- (IBAction)actionSaveMovie:(UIBarButtonItem *)sender {
    [self validationInputText];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self validationInputText];
    return NO;
}

@end

