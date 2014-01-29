//
//  AppDelegate.h
//  SessionLogin
//
//  Created by Renato Carvalhan on 1/29/14.
//  Copyright (c) 2014 Renato Carvalhan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FacebookSDK/FacebookSDK.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) FBSession *session;

@end
