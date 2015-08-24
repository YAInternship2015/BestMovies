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

@property (nonatomic, strong) SANDataSource *data;
@property (nonatomic, strong) NSArray *array;

@end

@implementation SANTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[SANDataSource alloc]initWithDelegate:self];
    self.array = [self.data allMovies];
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SANTableViewCell";
    SANMoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setupWithMovie:[self.array objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - SANModelsDataSourceDelegate

-(void)dataWasChanged:(SANDataSource *)data array:(NSArray *)array{
    self.array = array;
    [self.tableView reloadData];
}

@end
