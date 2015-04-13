//
//  ScoreEntity.h
//  CoreDataReview
//
//  Created by Wild Yaoyao on 14/11/26.
//  Copyright (c) 2014年 Yang Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ScoreEntity : NSManagedObject

@property (nonatomic) float chinese;
@property (nonatomic) float english;
@property (nonatomic, retain) NSManagedObject *toStudent;

@end
