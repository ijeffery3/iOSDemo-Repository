//
//  AIActionSheetView.h
//  AimAPP
//
//  Created by CosyVan on 16/10/22.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AIActionSheetView;

@protocol AIActionSheetViewDelegate <NSObject>

@required

/**
 Delegate method
 @param actionSheet The SRActionSheet instance.
 @param index       Top is 0 and 0++ to down, but cancelBtn's index is -1.
 */
- (void)actionSheet:(AIActionSheetView *)actionSheet didSelectSheet:(NSInteger)index;

@end

/**
 Block callback
 @param actionSheetView The same to the delegate.
 @param index           The same to the delegate.
 */
typedef void (^ActionSheetDidSelectSheetBlock)(AIActionSheetView *actionSheetView, NSInteger index);

@interface AIActionSheetView : UIView

#pragma mark - BLOCK

+ (void)showActionSheetViewWithTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray  *)otherButtonTitles
                       selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray  *)otherButtonTitles
             selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock;

#pragma mark - DELEGATE

+ (void)showActionSheetViewWithTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray  *)otherButtonTitles
                               delegate:(id<AIActionSheetViewDelegate>)delegate;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray  *)otherButtonTitles
                     delegate:(id<AIActionSheetViewDelegate>)delegate;

- (void)dismiss;
@end
