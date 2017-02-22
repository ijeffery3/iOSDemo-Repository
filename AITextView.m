//
//  AITextView.m
//  AimAPP
//
//  Created by CosyVan on 16/10/22.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "AITextView.h"

@implementation AITextView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self instalProper];
    [self addObserver];
    //   [self setPlaceHolder:_placeHolder];
}
-(instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder{
    if (self=[super initWithFrame:frame]) {
        [self instalProper];
        [self setPlaceHolder:placeHolder];
        [self addObserver];
    }
    return self;
}
-(instancetype)init{
    if (self=[super init]) {
        [self instalProper];
        [self addObserver];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self instalProper];
        [self addObserver];
    }
    return self;
}
-(void)instalProper{
    _placeColor=[UIColor grayColor];
    //  _placeHolder=@"请输入内容";
    if (_placeHolder.length<1 ) {
        [self setPlaceHolder:@"请输入内容"];
    }
    _cornerRadius=.0f;
    _borderWitdh=.0f;
    _borderColor=[UIColor clearColor];
    _placeColor=[UIColor grayColor];
    _infoColor=[UIColor blackColor];
    
}
-(void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder=placeHolder;
    self.text = placeHolder;
    self.textColor = _placeColor;
}
-(void)setPlaceColor:(UIColor *)placeColor{
    _placeColor=placeColor;
}
-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius=cornerRadius;
    self.layer.cornerRadius=cornerRadius;
}
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor=borderColor;
    self.layer.borderColor=_borderColor.CGColor;
}
-(void)setBorderWitdh:(CGFloat )borderWitdh{
    _borderWitdh=borderWitdh;
    self.layer.borderWidth=_borderWitdh;
}
-(void)addObserver
{
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(terminate:) name:UIApplicationWillTerminateNotification object:[UIApplication sharedApplication]];
}

- (void)terminate:(NSNotification *)notification {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didBeginEditing:(NSNotification *)notification {
    if ([self.text isEqualToString:self.placeHolder]) {
        self.text = @"";
        self.textColor = _infoColor;
    }
}

- (void)didEndEditing:(NSNotification *)notification {
    if (self.text.length<1) {
        self.text = self.placeHolder;
        self.textColor = _placeColor;
    }
}
-(void)dealloc{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
