//
//  UIImage+Icon.h
//  Utilities
//
//  Created by Toshiyuki Tezuka on 2013/04/24.
//  Copyright (c) 2013年 tsun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FontIconTypeMail        @"\u2709"
#define FontIconTypeUser        @"\u1F464"
#define FontIconTypeUsers       @"\u1F465"
#define FontIconTypePhone       @"\u1F4DE"
#define FontIconTypeLeftArrow   @"\u2B05"
#define FontIconTypeList        @"\u2630"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"
//#define FontIconType    @"\u"

@interface UIImage (Icon)

+ (UIImage *)imageWithFontIconType:(NSString*)type color:(UIColor*)color height:(float)height;
+ (UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;

@end
