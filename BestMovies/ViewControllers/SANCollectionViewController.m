//
//  SANCollectionViewController.m
//  BestMovies
//
//  Created by Admin on 18.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANCollectionViewController.h"
#import "SANDataSource.h"
#import "SANCollectionViewCell.h"

@interface SANCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SANModelsDataSourceDelegate>

@property (nonatomic, strong) SANDataSource *dataSource;

@end

@implementation SANCollectionViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[SANDataSource alloc] initWithDelegate:self];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource moviesCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"SANCollectionViewCell";
    SANCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    SANMovie *movie = [self.dataSource movieAtIndex:indexPath.item];
    [cell setupWithMovie:movie];
    return cell;
}

#pragma mark - SANModelsDataSourceDelegate

- (void)dataWasChanged:(SANDataSource *)data {
    [self.collectionView reloadData];
}

@end
