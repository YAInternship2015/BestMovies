//
//  SANTableViewController.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANTableViewController.h"
#import "SANMovie.h"
#import "SANMoviesCell.h"

@interface SANTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *arrayMovies;
@end

@implementation SANTableViewController

#warning Как я уже писал в замечаниях к заданию, Вы должны реализовать отдельный класс-датасорс, который будет хранить все модели Movie. Этим не должен заниматься вью контроллер, это не его ответственность. Этот класс-датасорс внутри себя хранит массив объектов Movie, но в *.h он его не показывает. В его *.h файле есть только необходимый вью контроллеру интерфейс, которого достаточно для отображения данных в таблице
static NSString* movies[] = {
    @"Transformers", @"Terminator", @"Bruce Lee", @"Men in Bleck",
    @"Superman", @"Hulk", @"Riddick", @"Batman", @"X-man", @"Faster"
};

- (void)viewDidLoad {
    [super viewDidLoad];
#warning это уйдет в датасорс
    self.arrayMovies = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i + 1]];
        SANMovie *movie = [[SANMovie alloc]initWithImage:image andName:movies[i]];
        [self.arrayMovies addObject:movie];
    }
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    SANMovie *movie = [self.arrayMovies objectAtIndex:indexPath.row];
#warning данный метод иногда вместо ячейки может вернуть nil. Вместо него используйте - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
    SANMoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
#warning заполнение ячейки данными надо инкапсулировать в самой ячейке
    cell.imageView.image = movie.avatarImage;
    cell.nameLabel.text = movie.name;
    return cell;
}

@end
