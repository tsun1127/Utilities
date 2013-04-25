//
//  UIImage+Icon.m
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/04/24.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import "UIImage+Icon.h"

@implementation UIImage (Icon)

#define FONT_ENTYPO     @"Entypo"
#define FONT_GLYPHS     @"webhostinghub-glyphs"

+ (UIImage *)imageWithFontIconType:(NSString*)type color:(UIColor*)color height:(float)height //size:(CGSize)size
{
    const char *fiName = [type UTF8String]; //"\u1F4DE";
//    const char *fiName = "\u2630";
    NSData *fiData = [NSData dataWithBytes:fiName length:strlen(fiName)];
    NSString *fiString = [[NSString alloc] initWithData:fiData encoding:NSUTF8StringEncoding];
    
    return [self imageFromText:fiString color:color fontSize:height];
}

+ (UIImage *)imageFromText:(NSString *)text color:(UIColor*)color fontSize:(float)fontSize
{
    // set the font type and size
    UIFont *font = [UIFont fontWithName:FONT_GLYPHS size:fontSize];
    CGSize size  = [text sizeWithFont:font];
    float pointX = 0.0f;
    
    if(size.height >= size.width)
    {
        pointX = (size.height-size.width)/2.0f;
        size.width = size.height;
    }
    else
    {
        size.height = size.width;
    }
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    }
    else
    {
        // iOS is < 4.0
        UIGraphicsBeginImageContext(size);
    }
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake(pointX, 0.0) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect
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

@end
