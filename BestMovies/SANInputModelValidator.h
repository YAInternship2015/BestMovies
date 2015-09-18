//
//  IsValidModel.h
//  BestMovies
//
//  Created by Admin on 20.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SANInputModelValidator : NSObject

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error;

@end
