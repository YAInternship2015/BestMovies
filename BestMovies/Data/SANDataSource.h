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

- (NSArray *)allMovies;
- (void)saveModel:(SANMovie *)model;
- (instancetype)initWithDelegate:(id<SANModelsDataSourceDelegate>)delegate;

@end

#warning зачем столько пустых строк?





@protocol SANModelsDataSourceDelegate <NSObject>
@required
#warning зачем здесь параметр array? те, кто использует датасорс, и так могут у него получить все необходимые данные
- (void)dataWasChanged:(SANDataSource *)data array:(NSArray *)array;

@end