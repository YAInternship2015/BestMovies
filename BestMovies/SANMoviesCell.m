//
//  SANMoviesCell.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANMoviesCell.h"

@interface SANMoviesCell()
#warning после @interface и перед @end должна быть пустая строка
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation SANMoviesCell
#warning @synthesize в данном случае можно не писать
@synthesize imageView = _imageView;

- (void)setupWithMovie:(SANMovie *)movie {
    self.imageView.image = movie.avatarImage;
    self.nameLabel.text = movie.name;
}

#warning данный стандартный метод ячейки можно удалить, Вы в нем ничего не кастомизируете
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
