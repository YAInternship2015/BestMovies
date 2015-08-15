//
//  SANTableViewController.m
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANTableViewController.h"
#import "SANDataSource.h"
#import "SANMoviesCell.h"

@interface SANTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SANDataSource *data;

@end

@implementation SANTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [SANDataSource new];
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.data allMovies] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    SANMoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setupWithMovie:[[self.data allMovies] objectAtIndex:indexPath.row]];
    return cell;
}

@end
