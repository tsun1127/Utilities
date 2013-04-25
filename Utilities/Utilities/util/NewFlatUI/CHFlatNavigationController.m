//
//  CHFlatNavigationController.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/04/23.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "CHFlatNavigationController.h"

@interface CHFlatNavigationController ()

@end

@implementation CHFlatNavigationController

@synthesize flatNavigationBarColor = _flatNavigationBarColor;
@synthesize backButtonFontName = _backButtonFontName;

#define DEFAULT_BACK_BAR_BUTTON_FONT_NAME Glyphs_FontIconTypeArrowLeftSmall

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.delegate = self;
        self.backButtonFontName = DEFAULT_BACK_BAR_BUTTON_FONT_NAME;
    }
    return self;
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
//    NSArray *array = self.viewControllers;
//    if([array count] > 0)
//    {
//        UIViewController *vc = [array objectAtIndex:[array count]-1];
//        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil
//                                                                              style:UIBarButtonItemStylePlain
//                                                                             target:nil
//                                                                             action:nil];
//        [backBarButtonItem setBackButtonBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 40)]
//                                               forState:UIControlStateNormal
//                                             barMetrics:UIBarMetricsDefault];
//        [backBarButtonItem setImage:[UIImage imageWithFontIconType:Glyphs_FontIconTypeArrowLeftSmall color:[UIColor whiteColor] height:20.0f]];
//        vc.navigationItem.backBarButtonItem = backBarButtonItem;
//    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /** Designed BackBar Button */
    NSArray *array = self.viewControllers;
    UIBarButtonItem *leftButton = [[[UIBarButtonItem alloc] initWithTitle:nil
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(back)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 20)]
                          forState:UIControlStateNormal
                        barMetrics:UIBarMetricsDefault];
    [leftButton setImage:[UIImage imageWithFontIconType:_backButtonFontName color:[UIColor whiteColor] height:20.0f]];
    
    if([array count] > 1)
    {
        UIViewController *vc = [array objectAtIndex:[array count]-1];
        vc.navigationItem.leftBarButtonItem = leftButton;
    }
}

- (void)back
{
    [self popViewControllerAnimated:true];
}

@end
