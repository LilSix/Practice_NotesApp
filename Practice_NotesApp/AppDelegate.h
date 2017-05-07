//
//  AppDelegate.h
//  Practice_NotesApp
//
//  Created by YU-CHEN, LIN on 12/04/2017.
//  Copyright © 2017 YU-CHEN, LIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void) saveContext;


@end

