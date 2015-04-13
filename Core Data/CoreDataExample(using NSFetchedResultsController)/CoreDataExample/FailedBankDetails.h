//
//  FailedBankDetails.h
//  CoreDataExample
//
//  Created by Wild Yaoyao on 7/24/14.
//  Copyright (c) 2014 Wild Yaoyao. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankInfo;

@interface FailedBankDetails : NSManagedObject

@property (nonatomic, strong) NSNumber *zip;
@property (nonatomic, strong) NSDate *closeDate;
@property (nonatomic, strong) NSDate *updateDate;
@property (nonatomic, strong) FailedBankInfo *info;

@end
