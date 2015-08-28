//
//  SANMovieFactory.m
//  BestMovies
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMovieFactory.h"
#import "SANMovie.h"

@implementation SANMovieFactory

+ (SANMovie *)movieWithText:(NSString *)text image:(UIImage *)image {
#warning снова потеряли пробел после alloc]
    SANMovie *movie = [[SANMovie alloc]initWithImage:image name:text];
    return movie;
}

@end
