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
        
        UIImage* bgImage = [self imageWithColor:_flatNavigationBarColor rect:CGRectMake(0, 0, 1, 1)];
        [bgImage drawInRect:CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height)];
        [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    }
}

- (UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect
{
//    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext(); //autorelease?
    UIGraphicsEndImageContext();
    return img;
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
        [backBarButtonItem setBackButtonBackgroundImage:[self imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 40)]
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
        [backBarButtonItem setImage:[self imageFromText:@"←" fontSize:60.0f]];
        vc.navigationItem.backBarButtonItem = backBarButtonItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(UIImage *)imageFromText:(NSString *)text fontSize:(float)fontSize
{
    // set the font type and size
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize]; //[UIFont systemFontOfSize:fontSize];
    CGSize size  = [text sizeWithFont:font];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    else
        // iOS is < 4.0
        UIGraphicsBeginImageContext(size);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake(0.0, 0.0) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
