//
//  SANMoviesCell.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMoviesCell.h"

@interface SANMoviesCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation SANMoviesCell
@synthesize imageView = _imageView;

- (void)setupWithMovie:(SANMovie *)movie{
    self.imageView.image = movie.avatarImage;
    self.nameLabel.text = movie.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
