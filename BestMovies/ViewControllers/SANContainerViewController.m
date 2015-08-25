//
//  ContainerViewController.m
//  BestMovies
//
//  Created by Admin on 18.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANContainerViewController.h"
#import "SANTableViewController.h"
#import "SANCollectionViewController.h"

@interface SANContainerViewController ()

#warning не совсем понятно, что храниться в данной переменной. Надо дать более понятное название
@property (nonatomic, assign) BOOL switcher;
@property (nonatomic, strong) SANTableViewController *tableVC;
@property (nonatomic, strong) SANCollectionViewController *collectionVC;

@end

@implementation SANContainerViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.switcher = YES;
    
    self.tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SANTableViewController"];
    [self addChildViewController:self.tableVC];
    [self.view addSubview:self.tableVC.view];
    [self.tableVC didMoveToParentViewController:self];
}

#pragma mark - Actions

- (IBAction)switchAction:(UIBarButtonItem *)sender {
#warning достаточно просто if (self.switcher)
    if (self.switcher == YES) {
        self.collectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SANCollectionViewController"];
        [self swapFromViewController:self.tableVC toViewController:self.collectionVC];
        self.switcher = NO;
    }else{
        self.tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SANTableViewController"];
        [self swapFromViewController:self.collectionVC toViewController:self.tableVC];
        self.switcher = YES;
    }
}

#pragma mark - Methods

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    self.navigationController.navigationBar.translucent = NO;
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
    self.navigationController.navigationBar.translucent = YES;
}

@end