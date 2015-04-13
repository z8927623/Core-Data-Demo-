//
//  AppDelegate.h
//  CoreDataExample
//
//  Created by Wild Yaoyao on 7/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 数据管理上下文环境
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
// 数据管理模型
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
// 持久性数据协调器
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
