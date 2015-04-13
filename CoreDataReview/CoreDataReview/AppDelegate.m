//
//  AppDelegate.m
//  CoreDataReview
//
//  Created by Wild Yaoyao on 14/11/26.
//  Copyright (c) 2014年 Yang Yao. All rights reserved.
//

#import "AppDelegate.h"
#import "StudentEntity.h"

@interface AppDelegate () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    StudentEntity *student1 = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:context];
//    
//    student1.name = @"花花";
//    student1.age = 33;
//    
//    StudentEntity *student2 = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:context];
//    
//    student2.name = @"小黄";
//    student2.age = 22;
//    
//    StudentEntity *student3 = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:context];
//    
//    student3.name = @"小张";
//    student3.age = 11;
//    
//    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Couldn't save: %@", [error localizedDescription]);
//    }

    
    // 一次性加载到内存
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StudentEntity" inManagedObjectContext:context];

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
    
    StudentEntity *toBeDeletedStudent = nil;
    for (StudentEntity *student in fetchedObjects) {
        if ([fetchedObjects indexOfObject:student] == 0) {
            toBeDeletedStudent = student;
        }
        NSLog(@"name: %@  age: %d", student.name, student.age);
    }
    
    
    [toBeDeletedStudent.managedObjectContext deleteObject:toBeDeletedStudent];

    if (![context save:&error]) {
        NSLog(@"error:%@",error);
    }

    NSLog(@"\n");
    
    fetchedObjects = [context executeFetchRequest:request error:&error];
    
    for (StudentEntity *student in fetchedObjects) {

        NSLog(@"name: %@  age: %d", student.name, student.age);

    }

//    // 利用NSFetchedResultsController
//    NSManagedObjectContext *context = [self managedObjectContext];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StudentEntity" inManagedObjectContext:context];
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:entity];
//
//    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:NO];
//    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
//    [request setFetchBatchSize:20];
//    
//    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:@"Root"];
//    self.fetchedResultsController = fetchedResultsController;
//    self.fetchedResultsController.delegate = self;
//    
//    NSError *error;
//    if (![self.fetchedResultsController performFetch:&error]) {
//        NSLog(@"Fetch Error: %@, %@", error, [error userInfo]);
//    }
//    
//    NSArray *fetchedObjects = self.fetchedResultsController.fetchedObjects;
//
//    
//    StudentEntity *toBeDeletedStudent = nil;
//
//    for (StudentEntity *student in fetchedObjects) {
//        if ([fetchedObjects indexOfObject:student] == 0) {
//            toBeDeletedStudent = student;
//        }
//        NSLog(@"name: %@  age: %d", student.name, student.age);
//    }
//    
//    [toBeDeletedStudent.managedObjectContext deleteObject:toBeDeletedStudent];
//
//    if (![context save:&error]) {
//        NSLog(@"error:%@",error);
//    }
//    
//    NSLog(@"\n");
//    
//    
//    if (![self.fetchedResultsController performFetch:&error]) {
//        NSLog(@"Fetch Error: %@, %@", error, [error userInfo]);
//    }
//    
//    fetchedObjects = self.fetchedResultsController.fetchedObjects;
//    
//    for (StudentEntity *student in fetchedObjects) {
//        NSLog(@"name: %@  age: %d", student.name, student.age);
//    }
//
//    NSLog(@"%@", NSHomeDirectory());
    
    return YES;
}


#pragma mark - NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Yang-Yao.CoreDataReview" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataReview" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataReview.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
