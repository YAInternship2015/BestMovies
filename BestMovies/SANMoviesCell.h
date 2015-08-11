//
//  SANMoviesCell.h
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SANMoviesCell : UITableViewCell

#warning тут проблема с инкапсуляцией. Не нужно показывать наружу (в *.h файле) лишние свойства/методы. Если вы напишите метод вроде setupWithMovie:, в котором ячейка сама себя будет заполнять моделью, то объявления свойств переедут в *.m файл. Почитайте еще раз принципы SOLID
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
