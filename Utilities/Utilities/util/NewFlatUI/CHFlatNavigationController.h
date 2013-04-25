//
//  CHFlatNavigationController.h
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/04/23.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+Icon.h"
#import "CHFlatBarButtonItem.h"

@interface CHFlatNavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic,retain) UIColor *flatNavigationBarColor;
@property (nonatomic,retain) NSString *backButtonFontName;

@end
