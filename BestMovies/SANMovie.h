//
//  SANMovie.h
//  BestMovies
//
//  Created by Admin on 09.08.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SANMovie : NSObject

#warning Здесь в *.h файле Вы показали readwrite свойства, то есть извне любой класс сможет изменить модель, что не есть хорошо. В *.h файле соит показывать эти свойства с доступом readonly, чтобы их нельзя было менять извне
@property (strong, nonatomic) UIImage *avatarImage;
@property (strong, nonatomic) NSString *name;

#warning в obj-c в именах селекторов стоит избеать слова "and", достаточно просто initWithImage:name:
#warning также есть проблемы с форматированием кода, почитайте еще раз гайдлайны
- (instancetype)initWithImage:(UIImage*)image andName:(NSString*)name;

@end
