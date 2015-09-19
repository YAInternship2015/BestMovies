//
//  SANTableViewController.h
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SANDataSource;

@interface SANTableViewController : UITableViewController

@property (nonatomic, strong) SANDataSource *dataSource;

@end
