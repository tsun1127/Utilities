//
//  CHFlatNavigationController.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/04/23.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "CHFlatNavigationController.h"

#import "UIImage+Icon.h"

@interface CHFlatNavigationController ()

@end

@implementation CHFlatNavigationController

@synthesize flatNavigationBarColor = _flatNavigationBarColor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFlatNavigationBarColor:(UIColor *)flatNavigationBarColor
{
    if(_flatNavigationBarColor != flatNavigationBarColor)
    {
        [_flatNavigationBarColor release];
        _flatNavigationBarColor = nil;
        _flatNavigationBarColor = [flatNavigationBarColor retain];
        
        UIImage* bgImage = [UIImage imageWithColor:_flatNavigationBarColor rect:CGRectMake(0, 0, 1, 1)];
        [bgImage drawInRect:CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height)];
        [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *array = self.viewControllers;
    if([array count] > 0)
    {
        UIViewController *vc = [array objectAtIndex:[array count]-1];
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil
                                                                             action:nil];
        [backBarButtonItem setBackButtonBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 40)]
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
        [backBarButtonItem setImage:[UIImage imageWithFontIconType:FontIconTypeLeftArrow color:[UIColor whiteColor] height:60.0f]];
        vc.navigationItem.backBarButtonItem = backBarButtonItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
