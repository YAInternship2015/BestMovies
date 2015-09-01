//
//  SANCollectionViewCell.m
//  BestMovies
//
//  Created by Admin on 18.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANCollectionViewCell.h"
#import "SANMovie.h"

@interface SANCollectionViewCell()

#warning хоть Interface Builder сам расставляет (weak, nonatomic), по ялантис гайдлайнам мы пишем (nonatomic, weak). И также не стоит сокращать image до img, в obj-c не экономят на длине селекторов :) Эти же замечания справедливы и для SANMoviesCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation SANCollectionViewCell

- (void)setupWithMovie:(SANMovie *)movie {
    self.imgView.image = movie.avatarImage;
}

@end

