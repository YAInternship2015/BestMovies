//
//  SANDataSource.m
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANDataSource.h"

@interface SANDataSource()

@end

@implementation SANDataSource

#warning Синглтон - это антипаттерн, его стоит использовать только в исключительных ситуациях. В данной проекте достаточно создавать датасорс там, где он необходим, то есть во вью контроллере
+ (SANDataSource *)sharedManager{
    static SANDataSource *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SANDataSource alloc] init];
    });
    return manager;
}

#warning перед { должен быть пробел
- (instancetype)init{
    self = [super init];
    if (self) {
         NSString *movies[] = {
            @"Transformers", @"Terminator", @"Bruce Lee", @"Men in Bleck",
            @"Superman", @"Hulk", @"Riddick", @"Batman", @"X-man", @"Faster"
        };
        _arrayMovies = [NSMutableArray new];
        for (int i = 0; i < 10; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i + 1]];
            SANMovie *movie = [[SANMovie alloc]initWithImage:image name:movies[i]];
            [_arrayMovies addObject:movie];
        }
    }
    return self;
}

- (SANMovie *)movieAtIndex:(NSInteger)movie{
    return [_arrayMovies objectAtIndex:movie];
}


@end
