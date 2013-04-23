//
//  ViewController.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "ViewController.h"

#import "TTCommon.h"
#import "TTAsyncLoadImageSampleViewController.h"
#import "TTFlatButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TTFlatButton *button = [[TTFlatButton alloc] initWithColor:UIColorWithRGB(26, 139, 188)];
    button.frame = CGRectMake(0, 0, 180, 44);
    button.text = @"Button";
    button.center = self.view.center;
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)asynchLoadImage:(id)sender
{
    TTAsyncLoadImageSampleViewController * vc = [[TTAsyncLoadImageSampleViewController alloc] init];
    vc.title = @"title";
    [self.navigationController pushViewController:vc animated:true];
    [vc release];
}

@end
