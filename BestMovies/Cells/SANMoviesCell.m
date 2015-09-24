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

@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation SANMoviesCell

- (void)setupWithMovie:(SANMovie *)movie {
    self.avatarImageView.image = [UIImage imageNamed:movie.avatarImagePath];
    self.nameLabel.text = movie.name;
}

@end
