//
//  SANMovie.h
//  BestMovies
//
//  Created by Admin on 15.09.15.
//  Copyright (c) 2015 Ignatenko_Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SANMovie : NSManagedObject

@property (nonatomic, retain) NSString * avatarImagePath;
@property (nonatomic, retain) NSString * name;

@end
