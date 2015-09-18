//
//  SANDataSource.h
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SANMovie;

@interface SANDataSource : NSObject

- (NSInteger)moviesCount;
- (instancetype)initWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;
- (void)addModelWithImagePath:(NSString *)imagePath name:(NSString *)name;
- (void)deleteModelWithIndex:(NSIndexPath *)index;
- (SANMovie *)modelWithIndexPath:(NSIndexPath *)indexPath;
- (void)saveContext;

@end

