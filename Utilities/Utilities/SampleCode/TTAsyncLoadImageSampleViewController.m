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
    for(int i=0; i<6; i++)
    {
        [self loadImage:url index:i];
    }
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
                                                        completion:^{
                                                            NSLog(@"Finish!!");
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
