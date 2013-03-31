//
//  ViewController.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "ViewController.h"
#import "TTAsyncLoadImageSampleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)asynchLoadImage:(id)sender
{
    TTAsyncLoadImageSampleViewController * vc = [[TTAsyncLoadImageSampleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
    [vc release];
}

@end
