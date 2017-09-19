//
//  DemoViewController.m
//  ASDK_Demo
//
//  Created by JefferyWan on 2017/8/21.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import "DemoViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

static UIColor *randomColor() {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@interface DemoViewController ()

@property (strong, nonatomic) ASTextNode *textNode;
@property (nonatomic, strong) Class layoutExampleClass;


@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary *attrs = @{
                            NSFontAttributeName: [UIFont systemFontOfSize:12.0f],
                            NSForegroundColorAttributeName: [UIColor redColor],
                            };
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"shuffle"
                                                                 attributes:attrs];
    
    self.textNode = [[ASTextNode alloc] init];
    self.textNode.frame = CGRectMake(0, 100, 50, 30);
    self.textNode.attributedText = string;
    
    [self.view addSubnode:self.textNode];
    
    ASNetworkImageNode *netImage = [[ASNetworkImageNode alloc] init];
    netImage.URL = [NSURL URLWithString:@"https://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/00e93901213fb80ee2fd8ba430d12f2eb9389491.jpg"];
    netImage.frame = CGRectMake(0, 200, 80, 80);
    [self.view addSubnode:netImage];
    
    ASEditableTextNode *textField = [[ASEditableTextNode alloc] init];
    textField.frame = CGRectMake(100, 100, 100, 30);
    textField.attributedPlaceholderText = string ;
    [self.view addSubnode:textField];
    
    ASImageNode *image = [[ASImageNode alloc] init];
    image.frame = CGRectMake(100, 200, 80, 80);
    image.image = [UIImage imageNamed:@"10.png"];
    [self.view addSubnode:image];
    
//    ASMultiplexImageNode *multiplexImage = [[ASMultiplexImageNode alloc] init];
//    multiplexImage.frame = CGRectMake(200, 200, 80, 80);
//    multiplexImage.image = [UIImage imageNamed:@"10.png"];
//    [self.view addSubnode:multiplexImage];
    
    
    ASButtonNode *btn = [[ASButtonNode alloc] init];
    btn.frame = CGRectMake(0, 300, 100, 30);
    [btn setTitle:@"哈哈哈哈" withFont:nil withColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitle:@"哈哈哈哈" withFont:nil withColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(hhaha) forControlEvents:ASControlNodeEventTouchUpInside];
    [self.view addSubnode:btn];
    
    
    ASScrollNode *scroll = [[ASScrollNode alloc] init];
    scroll.automaticallyManagesSubnodes = YES;
    scroll.automaticallyManagesContentSize = YES;
    
    scroll.layoutSpecBlock = ^(ASDisplayNode *node, ASSizeRange constrainedSize){
        ASStackLayoutSpec *stack = [ASStackLayoutSpec verticalStackLayoutSpec];
        // Add children to the stack.
        return stack;
    };
    
    [self.view addSubnode:scroll];
}


- (void)hhaha
{
    NSLog(@"-----------------------");
    NSLog(@"***");
    NSLog(@"-----------------------");
}





@end
