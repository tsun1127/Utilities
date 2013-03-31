//
//  TTAsyncImageView.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "TTAsyncImageView.h"

@implementation TTAsyncImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
          URLString:(NSString*)URLString
         completion:(void(^)(void))completion
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self startIndicator];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URLString]];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
                completion();
                [_indicator stopAnimating];
            });
        });
    }
    return self;
}

- (void)startIndicator
{
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:_indicator];
    [_indicator startAnimating];
    [_indicator release];
}

@end
