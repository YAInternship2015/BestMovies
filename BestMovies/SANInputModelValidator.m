//
//  IsValidModel.m
//  BestMovies
//
//  Created by Admin on 20.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANInputModelValidator.h"

@implementation SANInputModelValidator

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
#warning Серьезная проверка :) Достаточно было проверить length > 3.
    NSCharacterSet *validationSet = [NSCharacterSet characterSetWithCharactersInString:@"!@#$%^&*()_=~/*+-"];
    NSArray *components = [title componentsSeparatedByCharactersInSet:validationSet];
    
    if ([components count] > 1) {
        if (error != nil) {
#warning Генерируете NSError правильно, но на лицо дублирование кода. Чтобы такого не было, можно написать категорию на NSError, где будет метод, создающий ошибку с передаваемым в этот метод описанием
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = NSLocalizedString(@"The input can contain only letters or numbers", @"");
            NSArray *objArray = [NSArray arrayWithObjects:description, reason, nil];
            NSArray *keyArray = [NSArray arrayWithObjects:NSLocalizedDescriptionKey,
                                 NSLocalizedFailureReasonErrorKey, nil];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objArray
                                                                 forKeys:keyArray];
#warning domain - это обычно какая-то строка, характерная для приложения. Например, "com.ignatenko.bestmovies"
            *error = [NSError errorWithDomain:@"InputValidationErrorDomain"
                                         code:3
                                     userInfo:userInfo];
        }
        return NO;
    } else if (title.length < 3) {
        if (error != nil) {
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = NSLocalizedString(@"Character count is less two", @"");
            NSArray *objArray = [NSArray arrayWithObjects:description, reason, nil];
            NSArray *keyArray = [NSArray arrayWithObjects:NSLocalizedDescriptionKey,
                                 NSLocalizedFailureReasonErrorKey, nil];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objArray
                                                                 forKeys:keyArray];
            *error = [NSError errorWithDomain:@"InputValidationErrorDomain"
                                         code:4
                                     userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}

@end
