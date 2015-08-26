//
//  SANDataSource.h
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SANMovie;

@protocol SANModelsDataSourceDelegate;

@interface SANDataSource : NSObject

- (SANMovie *)movieAtIndex:(NSInteger)index;
- (NSInteger)moviesCount;
- (void)saveModel:(SANMovie *)model;
- (instancetype)initWithDelegate:(id<SANModelsDataSourceDelegate>)delegate;

@end

@protocol SANModelsDataSourceDelegate <NSObject>
@required

- (void)dataWasChanged:(SANDataSource *)data;

@end