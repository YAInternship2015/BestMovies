//
//  SANMovie.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMovie.h"

@implementation SANMovie

- (instancetype)initWithImage:(UIImage *)image name:(NSString *)name {
    self = [super init];
    if (self) {
        _avatarImage = image;
        _name = name;
    }
    return self;
}

@end
