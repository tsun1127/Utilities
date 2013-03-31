//
//  TTAsyncImageView.h
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/03/31.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTAsyncImageView : UIImageView
{
    UIActivityIndicatorView *_indicator;
}

- (id)initWithFrame:(CGRect)frame
          URLString:(NSString*)URLString
         completion:(void(^)(TTAsyncImageView *))completion;

@end
