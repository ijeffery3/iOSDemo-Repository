//
//  AITextView.h
//  AimAPP
//
//  Created by CosyVan on 16/10/22.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AITextView : UITextView


/**
 *  placeholder
 */
@property(nonatomic,copy)IBInspectable NSString *placeHolder;
/**
 *  placeholder color 默认graycolor
 */
@property(nonatomic,copy)IBInspectable UIColor *placeColor;
/**
 *  文字颜色 默认黑色
 
 */
@property(nonatomic,copy)IBInspectable UIColor *infoColor;
/**
 *  边框颜色 默认无
 */
@property(nonatomic,copy)IBInspectable   UIColor *borderColor;
/**
 *  边框大小 默认0
 */
@property(nonatomic,assign)IBInspectable  CGFloat borderWitdh;
/**
 *  圆角 默认无
 */
@property(nonatomic,assign)IBInspectable  CGFloat cornerRadius;
/**
 *  初始化
 */
-(instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString*)placeHolder;


@end
