//
//  SANDataSource.m
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import "SANDataSource.h"
#import "SANMovie.h"
#import "SANConstants.h"

@interface SANDataSource() 

@property (nonatomic, strong) NSArray *arrayMovies;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *tempStringForNotification;
@property (nonatomic, weak) id<SANModelsDataSourceDelegate> delegate;

@end

@implementation SANDataSource

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self writeMovieFromPlistBundleToDocuments];
        self.arrayMovies = [self readModels];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(movieTitleDidChanged:)
                                                     name:SANDataFileContentDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (instancetype)initWithDelegate:(id<SANModelsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Methods

- (NSInteger)moviesCount {
    return [self.arrayMovies count];
}

- (SANMovie *)movieAtIndex:(NSInteger)index {
    return [self.arrayMovies objectAtIndex:index];
}

- (void)writeMovieFromPlistBundleToDocuments {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: self.path]) {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"SANDataSource" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: self.path error:&error];
    }
}

- (NSArray *)readModels {
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc]initWithContentsOfFile:self.path];
    NSArray *imgArray = [savedStock valueForKey:@"images"];
    NSArray *nameArray = [savedStock valueForKey:@"names"];
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < [nameArray count]; i++) {
        UIImage *image = [UIImage imageNamed:[imgArray objectAtIndex:i]];
        NSString *name = [nameArray objectAtIndex:i];
        SANMovie *movie = [[SANMovie alloc] initWithImage:image name:name];
        [array addObject:movie];
    }
    return array;
}

- (void)saveModel:(SANMovie *)model {
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc]initWithContentsOfFile:self.path];
    NSMutableArray *imgArray = [savedStock valueForKey:@"images"];
    NSMutableArray *titleArray = [savedStock valueForKey:@"names"];
    
    [titleArray addObject:model.name];
    
    NSInteger randomNumber = arc4random() % 10 + 1;
    
    [imgArray addObject:[NSString stringWithFormat:@"%ld.jpg", (long)randomNumber]];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: imgArray, @"images", titleArray, @"names", nil];
    [dict writeToFile:self.path atomically: YES];
    
    self.tempStringForNotification = model.name;
}

-(void)setTempStringForNotification:(NSString *)tempStringForNotification {
    _tempStringForNotification = tempStringForNotification;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:SANDataFileContentDidChangeNotification
                      object:nil
                    userInfo:nil];
}

#pragma mark - Notification

- (void)movieTitleDidChanged:(NSNotification *)notification {
    self.arrayMovies = [self readModels];
    [self.delegate dataWasChanged:self];
}

@end


