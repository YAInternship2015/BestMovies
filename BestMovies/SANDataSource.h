//
//  SANDataSource.h
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SANMovie.h"

@interface SANDataSource : NSObject
@property (strong, nonatomic, readonly) NSMutableArray *arrayMovies;

+ (SANDataSource *)sharedManager;
- (SANMovie *)movieAtIndex:(NSInteger)movie;

@end
