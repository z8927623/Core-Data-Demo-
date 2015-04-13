//
//  StudentEntity.h
//  CoreDataReview
//
//  Created by Wild Yaoyao on 14/11/26.
//  Copyright (c) 2014年 Yang Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ScoreEntity;

@interface StudentEntity : NSManagedObject

@property (nonatomic) int16_t age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) ScoreEntity *toScore;

@end
