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

@interface SANTableViewController () <UITableViewDataSource, UITableViewDelegate, SANModelsDataSourceDelegate>

@property (nonatomic, strong) SANDataSource *dataSource;

@end

@implementation SANTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[SANDataSource alloc]initWithDelegate:self];
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource moviesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SANTableViewCell";
    SANMoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setupWithMovie:[self.dataSource movieAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - SANModelsDataSourceDelegate

-(void)dataWasChanged:(SANDataSource *)data {
    [self.tableView reloadData];
}

@end
