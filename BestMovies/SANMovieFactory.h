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

#warning слово "create" здесь лишнее. movieWithText:image:
+ (SANMovie *)createMovieWithText:(NSString *)text image:(UIImage *)image;

@end
