//
//  SANCollectionViewController.h
//  BestMovies
//
//  Created by Admin on 18.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SANDataSource;

@interface SANCollectionViewController : UICollectionViewController

#warning это свойство не должно быть в *.h, перенесите его в *.m и в *.h оставьте только сеттер. Это касается и остальных контроллеров
@property (nonatomic, strong) SANDataSource *dataSource;

@end
