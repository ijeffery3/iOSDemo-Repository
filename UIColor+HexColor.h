//
//  UIColor+HexColor.h
//  TradeUnion
//
//  Created by JefferyWan on 2017/3/6.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
