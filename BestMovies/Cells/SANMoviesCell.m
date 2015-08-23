//
//  SANMoviesCell.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMoviesCell.h"
#import "SANMovie.h"

@interface SANMoviesCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SANMoviesCell

- (void)setupWithMovie:(SANMovie *)movie {
    self.imgView.image = movie.avatarImage;
    self.nameLabel.text = movie.name;
}

@end
