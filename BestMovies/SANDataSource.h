//
//  SANDataSource.h
//  BestMovies
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SANMovie.h"

@interface SANDataSource : NSObject
#warning после @interface и перед @end должна быть пустая строка
#warning и принято писать (nonatomic, strong, readonly), а вообще показывать массив в *.h нет необходимости, вью контроллеру нужно только знать, сколько всего элементов он должен отобразить и какой элемент под каким индексом
@property (strong, nonatomic, readonly) NSMutableArray *arrayMovies;

+ (SANDataSource *)sharedManager;
#warning почему имя параметра, который индекс, звучит как movie? index же
- (SANMovie *)movieAtIndex:(NSInteger)movie;

@end
