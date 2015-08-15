//
//  SANMovie.h
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SANMovie : NSObject

@property (nonatomic, strong, readonly) UIImage *avatarImage;
@property (nonatomic, strong, readonly) NSString *name;

- (instancetype)initWithImage:(UIImage *)image name:(NSString *)name;

@end
