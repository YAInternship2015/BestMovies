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

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation SANCollectionViewCell

- (void)setupWithMovie:(SANMovie *)movie {
    self.imgView.image = movie.avatarImage;
}

@end
