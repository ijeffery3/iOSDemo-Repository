//
//  PageNode.m
//  ASDK_Demo
//
//  Created by JefferyWan on 2017/8/21.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import "PageNode.h"

@implementation PageNode


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    return constrainedSize;
}

- (void)fetchData
{
    [super fetchData];
    NSLog(@"Fetching data for node: %@", self);
}


@end
