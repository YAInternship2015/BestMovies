//
//  SANDataSource.h
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
<<<<<<< HEAD

@class SANMovie;

@protocol SANModelsDataSourceDelegate;
=======
>>>>>>> 27c32398648f480c9f544dd03ca5aaa6c3511daa

@interface SANDataSource : NSObject

- (NSArray *)allMovies;
- (void)saveModel:(SANMovie *)model;
- (instancetype)initWithDelegate:(id<SANModelsDataSourceDelegate>)delegate;

@end







@protocol SANModelsDataSourceDelegate <NSObject>
@required

- (void)dataWasChanged:(SANDataSource *)data array:(NSArray *)array;

@end