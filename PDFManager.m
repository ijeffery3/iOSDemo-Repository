//
//  PDFManager.m
//  aaa
//
//  Created by JefferyWan on 2017/4/28.
//  Copyright © 2017年 tenmaker. All rights reserved.
//

#import "PDFManager.h"
#import <UIKit/UIKit.h>

@implementation PDFManager

+ (void)createJPGFromPDF:(NSString *)fromPDFName
{
    if (fromPDFName == nil || [fromPDFName isEqualToString:@""]) {
        return;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *docPath = [documentsDir stringByAppendingPathComponent:fromPDFName];
    
    NSURL *fromPDFURL = [NSURL fileURLWithPath:docPath];
    CGPDFDocumentRef fromPDFDoc = CGPDFDocumentCreateWithURL((CFURLRef) fromPDFURL);
    
    // 获取pdf总页数
    size_t pages = CGPDFDocumentGetNumberOfPages(fromPDFDoc);
    
    // 创建文件存放照片
    NSError *error = nil;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *folderPath = [documentsDir stringByAppendingPathComponent:[fromPDFName stringByDeletingPathExtension]];
    [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    int i = 1;
    for (i = 1; i <= pages; i++) {
        CGPDFPageRef pageRef = CGPDFDocumentGetPage(fromPDFDoc, i);
        CGPDFPageRetain(pageRef);
        
        // determine the size of the PDF page
        CGRect pageRect = CGPDFPageGetBoxRect(pageRef, kCGPDFMediaBox);
        
        // renders its content.
        UIGraphicsBeginImageContext(pageRect.size);
        
        CGContextRef imgContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(imgContext);
        CGContextTranslateCTM(imgContext, 0.0, pageRect.size.height);
        CGContextScaleCTM(imgContext, 1.0, -1.0);
        CGContextSetInterpolationQuality(imgContext, kCGInterpolationDefault);
        CGContextSetRenderingIntent(imgContext, kCGRenderingIntentDefault);
        CGContextDrawPDFPage(imgContext, pageRef);
        CGContextRestoreGState(imgContext);
        
        //PDF Page to image
        UIImage *tempImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        //Release current source page
        CGPDFPageRelease(pageRef);
        
        // Store IMG
        NSString *imgname = [NSString stringWithFormat:@"%@_%d.jpg",[fromPDFName stringByDeletingPathExtension], i];
        NSString *imgPath = [folderPath stringByAppendingPathComponent:imgname];
        [UIImageJPEGRepresentation(tempImage, 1.0) writeToFile:imgPath atomically:YES];
        
    }
    
    CGPDFDocumentRelease(fromPDFDoc);
}


@end
