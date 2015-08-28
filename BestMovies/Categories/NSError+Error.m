//
//  NSError+Error.m
//  BestMovies
//
//  Created by Admin on 28.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "NSError+Error.h"

@implementation NSError (Error)

+ (NSError *)errorWithDescription:(NSString *)description reason:(NSString *)reason {
   
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey : description,
                               NSLocalizedFailureReasonErrorKey : reason
                               };
    
    NSError *error = [NSError errorWithDomain:@"com.ignatenko.bestmovies"
                                 code:3
                             userInfo:userInfo];
    return error;
}

@end
