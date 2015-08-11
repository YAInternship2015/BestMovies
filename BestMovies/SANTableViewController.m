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

@end

@implementation SANTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[SANDataSource sharedManager].arrayMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    SANMoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setupWithMovie:[[SANDataSource sharedManager].arrayMovies objectAtIndex:indexPath.row]];
    return cell;
}

@end
