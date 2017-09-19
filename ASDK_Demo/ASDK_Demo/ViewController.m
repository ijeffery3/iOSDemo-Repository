//
//  ViewController.m
//  ASDK_Demo
//
//  Created by JefferyWan on 2017/8/21.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

static UIColor *randomColor() {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}



@interface ViewController ()<ASTableDataSource, ASTableDelegate>

@property (nonatomic, copy) NSArray *imageCategories;
@property (nonatomic, strong, readonly) ASTableNode *tableNode;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super initWithNode:[ASTableNode new]];
    if (self == nil) { return self; }
    
    _imageCategories = @[@"abstract", @"animals", @"business", @"cats", @"city", @"food", @"nightlife", @"fashion", @"people", @"nature", @"sports", @"technics", @"transport"];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.node.delegate = self;
    self.node.dataSource = self;

}


#pragma mark - ASTableDataSource / ASTableDelegate

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section
{
    return self.imageCategories.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // As the block is executed on a background thread we need to cache the image category string outside
    NSString *imageCategory = self.imageCategories[indexPath.row];
    return ^{
        ASTextCellNode *textCellNode = [ASTextCellNode new];
        textCellNode.text = [imageCategory capitalizedString];
        return textCellNode;
    };
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---->%ld",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
