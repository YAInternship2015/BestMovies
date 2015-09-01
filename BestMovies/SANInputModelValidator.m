//
//  IsValidModel.m
//  BestMovies
//
//  Created by Admin on 20.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANInputModelValidator.h"
#import "NSError+Error.h"

@implementation SANInputModelValidator

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
#warning цифру 3 лучше объявить константой в прямо в этом файле (потому что она используется только в этом файле) и назвать ее kMinMovieModelTitleLength. Иначе просто цифра 3 посреди кода выглядит "магически" и не сразу ясно, что она означает
    if (title.length < 3) {
        if (error != nil) {
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = NSLocalizedString(@"Number of characters is less than three", @"");

            *error = [NSError errorWithDescription:description reason:reason];
        }
        return NO;
    }
    return YES;
}

@end
