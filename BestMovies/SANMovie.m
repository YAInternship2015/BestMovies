//
//  SANMovie.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMovie.h"

@implementation SANMovie

- (instancetype)initWithImage:(UIImage*)image andName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.avatarImage = image;
        self.name = name;
    }
    return self;
}
@end
