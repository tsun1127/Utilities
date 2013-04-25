//
//  TTAsyncLoadImageSampleViewController.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "TTAsyncLoadImageSampleViewController.h"
#import "TTAsyncImageView.h"

#import <QuartzCore/QuartzCore.h>
#import "UIImage+Icon.h"

@interface TTAsyncLoadImageSampleViewController ()

@end

@implementation TTAsyncLoadImageSampleViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *url = @"http://img.youtube.com/vi/bNNzRyd1xz0/0.jpg";
    for(int i=0; i<1; i++)
    {
        [self loadImage:url index:i];
    }
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    /** Icon1 */
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:nil
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:nil
                                                                   action:nil];
    [rightButton setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 20)]
                           forState:UIControlStateNormal
                         barMetrics:UIBarMetricsDefault];
    [rightButton setImage:[UIImage imageWithFontIconType:Glyphs_FontIconTypeCreateNew color:[UIColor whiteColor] height:18.0f]];
    [arr addObject:rightButton];
    [rightButton release];
    
    /** Icon2 */
    rightButton = [[UIBarButtonItem alloc] initWithImage:nil
                                                   style:UIBarButtonItemStylePlain
                                                  target:nil
                                                  action:nil];
    [rightButton setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 20)]
                           forState:UIControlStateNormal
                         barMetrics:UIBarMetricsDefault];
    [rightButton setImage:[UIImage imageWithFontIconType:Glyphs_FontIconTypeDustbox color:[UIColor whiteColor] height:18.0f]];
    [arr addObject:rightButton];
    [rightButton release];
    
    /** Icon3 */
    rightButton = [[UIBarButtonItem alloc] initWithImage:nil
                                                   style:UIBarButtonItemStylePlain
                                                  target:nil
                                                  action:nil];
    [rightButton setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] rect:CGRectMake(0, 0, 20, 20)]
                           forState:UIControlStateNormal
                         barMetrics:UIBarMetricsDefault];
    [rightButton setImage:[UIImage imageWithFontIconType:Glyphs_FontIconTypeMenu color:[UIColor whiteColor] height:18.0f]];
    [arr addObject:rightButton];
    [rightButton release];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithArray:arr];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:true];
}

static const float kImageViewWidth = 160.0f;
static const float kImageViewHeight = 160.0f;

- (void)loadImage:(NSString*)URLString
            index:(int)index
{   
    TTAsyncImageView *iv = [[TTAsyncImageView alloc] initWithFrame:CGRectMake(index%2*kImageViewWidth,
                                                                              index/2*kImageViewHeight,
                                                                              kImageViewWidth,
                                                                              kImageViewHeight)
                                                         URLString:URLString
                                                        completion:^(TTAsyncImageView *loaded) {
                                                            NSLog(@"Finish!!, %@", loaded);
                                                            loaded.center = CGPointMake(160,240);
                                                            //adding shadow
                                                            loaded.layer.shadowRadius = 3;
                                                            loaded.layer.shadowColor = [[UIColor blackColor] CGColor];
                                                            loaded.layer.shadowOpacity = 0.7f;
                                                            loaded.layer.shadowOffset = CGSizeMake(-2, 2);
//                                                            loaded.layer.shadowPath = [UIBezierPath bezierPathWithRect:loaded.bounds];
                                                        }];
    
    iv.layer.borderWidth = 1.0f;
    iv.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self.view addSubview:iv];
    [iv release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
