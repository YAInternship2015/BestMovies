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
@property (strong, nonatomic) UIImage *avatarImage;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithImage:(UIImage*)image andName:(NSString*)name;

@end
