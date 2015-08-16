//
//  SANDataSource.m
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANDataSource.h"

@interface SANDataSource ()

@property (nonatomic, strong) NSMutableArray *arrayMovies;

@end

@implementation SANDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        self.arrayMovies = [NSMutableArray array];
        NSString *movies[] = {
            @"Transformers", @"Terminator", @"Bruce Lee", @"Men in Bleck",
            @"Superman", @"Hulk", @"Riddick", @"Batman", @"X-man", @"Faster"
        };
        self.arrayMovies = [NSMutableArray new];
        for (int i = 0; i < 10; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i + 1]];
            SANMovie *movie = [[SANMovie alloc]initWithImage:image name:movies[i]];
            [self.arrayMovies addObject:movie];
        }
    }
    return self;
}

- (NSArray *)allMovies {
    return self.arrayMovies;
}

@end
