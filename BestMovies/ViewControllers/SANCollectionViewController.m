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

#warning лучше все же datasoure, а не data
@property (nonatomic, strong) SANDataSource *data;
#warning не нужно хранить массив, который и так есть в датасорсе
@property (nonatomic, strong) NSArray *array;

@end

@implementation SANCollectionViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
#warning после alloc] нужен пробел
    self.data = [[SANDataSource alloc]initWithDelegate:self];
    self.array = [self.data allMovies];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning тут нужно обращаться к датасорсу
    return [self.array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"SANCollectionViewCell";
    SANCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
#warning тут нужно обращаться к датасорсу
    SANMovie *movie = [self.array objectAtIndex:indexPath.item];
    [cell setupWithMovie:movie];

    return cell;
}

#pragma mark - SANModelsDataSourceDelegate

- (void)dataWasChanged:(SANDataSource *)data array:(NSArray *)array{
    self.array = array;
    [self.collectionView reloadData];
}

@end
