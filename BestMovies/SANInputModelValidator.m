//
//  IsValidModel.m
//  BestMovies
//
//  Created by Admin on 20.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANInputModelValidator.h"
#import "NSError+Error.h"

static NSInteger const kMinMovieModelTitleLength = 3;

@implementation SANInputModelValidator

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
    
    if (title.length < kMinMovieModelTitleLength) {
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
