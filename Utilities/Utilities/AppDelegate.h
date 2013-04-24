//
//  AppDelegate.h
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TTFlatNavigationController.h"
#import "CHFlatNavigationController.h"

#import "UIImage+Icon.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;
//@property (strong,nonatomic) UINavigationController *navigationController;

//@property (strong,nonatomic) TTFlatNavigationController *navigationController;
@property (strong, nonatomic) CHFlatNavigationController *navigationController;

@end
