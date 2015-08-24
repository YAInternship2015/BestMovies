//
//  SANMovieFactory.h
//  BestMovies
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SANMovie;

@interface SANMovieFactory : NSObject

+ (SANMovie *)createMovieWithText:(NSString *)text image:(UIImage *)image;

@end
