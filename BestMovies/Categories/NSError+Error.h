//
//  NSError+Error.h
//  BestMovies
//
//  Created by Admin on 28.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Error)

+ (NSError *)errorWithDescription:(NSString *)description reason:(NSString *)reason;

@end
