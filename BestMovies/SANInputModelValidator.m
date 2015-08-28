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
   
    if (title.length < 3) {
        if (error != nil) {
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = NSLocalizedString(@"Number of characters is less than three", @"");
            NSArray *objArray = [NSArray arrayWithObjects:description, reason, nil];
            NSArray *keyArray = [NSArray arrayWithObjects:NSLocalizedDescriptionKey,
                                 NSLocalizedFailureReasonErrorKey, nil];
#warning намного более читабельным было бы объявление 
//            @{
//              NSLocalizedDescriptionKey : description,
//              NSLocalizedFailureReasonErrorKey : reason
//               }
#warning еще можно было заморочиться и создавать NSError в категории на NSError, где объявить метод +errorWithDescription:reason:
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objArray
                                                                 forKeys:keyArray];
            *error = [NSError errorWithDomain:@"com.ignatenko.bestmovies"
                                         code:3
                                     userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}

@end
