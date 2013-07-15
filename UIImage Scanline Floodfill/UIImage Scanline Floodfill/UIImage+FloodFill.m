//
//  UIImage+FloodFill.m
//  ImageFloodFilleDemo
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//


#import "UIImage+FloodFill.h"

@implementation UIImage (FloodFill)

- (UIImage *) floodFillColor:(UIColor *)oldColor
                   withColor:(UIColor *)newColor
                     atPoint:(CGPoint)starPoint
               withTolerance:(int)olerance
{
    @try
    {
        /*
            First We create roqData from UIImage.
            We require this conversation so that we can use detail at pixcel like color at pixcel.
            You can get some discussion about this topic here:
            http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics
         */
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGImageRef imageRef = [self CGImage];
        
        NSUInteger width = CGImageGetWidth(imageRef);
        NSUInteger height = CGImageGetHeight(imageRef);
        
        unsigned char *imageData = malloc(height * width * 4);
        
        NSUInteger bytesPerPixel = 4;
        NSUInteger bytesPerRow = bytesPerPixel * width;
        NSUInteger bitsPerComponent = 8;
        
        CGContextRef context = CGBitmapContextCreate(imageData,
                                                     width,
                                                     height,
                                                     bitsPerComponent,
                                                     bytesPerRow,
                                                     colorSpace,
                                                     kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        
        CGColorSpaceRelease(colorSpace);
        
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
        CGContextRelease(context);
        
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception : %@", exception);
    }
}
@end
