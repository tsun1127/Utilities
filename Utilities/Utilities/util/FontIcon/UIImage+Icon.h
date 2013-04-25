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

/** "Glyphs" */
#define Glyphs_FontIconTypeGitHub           @"\uF081"
#define Glyphs_FontIconTypeArrowLeft        @"\uF305"
#define Glyphs_FontIconTypeArrowLeftSmall   @"\uF489"
#define Glyphs_FontIconTypeArrowLeftiOS     @"\uF505"
#define Glyphs_FontIconTypeArrowLeftCircle  @"\uF3C6"

#define Glyphs_FontIconTypeMenu             @"\uF127"
#define Glyphs_FontIconTypeDustbox          @"\uF0CE"
#define Glyphs_FontIconTypeCreateNew        @"\uF47C"
//#define Glyphs_FontIconType @"\u"
//#define Glyphs_FontIconType @"\u"
//#define Glyphs_FontIconType @"\u"
//#define Glyphs_FontIconType @"\u"

@interface UIImage (Icon)

+ (UIImage *)imageWithFontIconType:(NSString*)type color:(UIColor*)color height:(float)height;
+ (UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;

@end
