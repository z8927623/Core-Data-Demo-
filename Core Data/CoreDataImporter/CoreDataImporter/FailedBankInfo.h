//
//  FailedBankInfo.h
//  CoreDataExample
//
//  Created by Wild Yaoyao on 7/24/14.
//  Copyright (c) 2014 Wild Yaoyao. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankDetails;

@interface FailedBankInfo : NSManagedObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) FailedBankDetails *details;

@end
