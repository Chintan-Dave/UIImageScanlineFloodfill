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
                       image:(UIImage *)image
{
    @try
    {
        if([oldColor isEqual:newColor])
            return image;
        /*
            First We create roqData from UIImage.
            We require this conversation so that we can use detail at pixcel like color at pixcel.
            You can get some discussion about this topic here:
            http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics
         */
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGImageRef imageRef = [image CGImage];
        
        NSUInteger width = CGImageGetWidth(imageRef);
        NSUInteger height = CGImageGetHeight(imageRef);
        
        unsigned char *imageData = malloc(height * width * 4);
        
        NSUInteger bytesPerPixel = CGImageGetBitsPerPixel(imageRef) / 8;
        NSUInteger bytesPerRow = CGImageGetBytesPerRow(imageRef);
        NSUInteger bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
        
        CGContextRef context = CGBitmapContextCreate(imageData,
                                                     width,
                                                     height,
                                                     bitsPerComponent,
                                                     bytesPerRow,
                                                     colorSpace,
                                                     CGImageGetBitmapInfo(imageRef));
        CGColorSpaceRelease(colorSpace);
        
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
        
        unsigned int byteIndex = (bytesPerRow * starPoint.y) + starPoint.x * bytesPerPixel;
        
        unsigned int ocolor = [self colorCodeAtIndex:byteIndex forimage:imageData];
        unsigned int ncolor = [self colorCodeForColor:newColor];
        
        int x = starPoint.x;
        int y = starPoint.y;
    
        LinkedListStack *points = [[LinkedListStack alloc] initWithCapacity:500 incrementSize:500 andMultiplier:height];
        
        [points pushFrontX:x andY:y];
        
        while ([points popFront:&x andY:&y] != INVALID_NODE_CONTENT)
        {
            int y1 = y;
            
            unsigned int byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
            
            unsigned int color =  color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            
            while(y1 >= 0 && color == ocolor)
            {
                y1--;
                
                byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
        
                color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            }
            
            y1++;
        
            BOOL spanLeft  = NO;
            BOOL spanRight = NO;
            
            byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
            
            color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            
            while (y1 < height && color == ocolor)
            {
                byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
                
                int red   = (int)((0xff000000 & ncolor) >> 24);
                int green = (int)((0x00ff0000 & ncolor) >> 16);
                int blue  = (int)((0x0000ff00 & ncolor) >> 8);
                int alpha = (int)(0x000000ff & ncolor);
                
                imageData[byteIndex + 0] = red;
                imageData[byteIndex + 1] = green;
                imageData[byteIndex + 2] = blue;
                imageData[byteIndex + 3] = alpha;
                
                byteIndex = (bytesPerRow * y1) + (x - 1) * bytesPerPixel;
                
                color = [self colorCodeAtIndex:byteIndex forimage:imageData];
                
                if(!spanLeft && x > 0 && color == ocolor)
                {
                    [points pushFrontX:(x - 1) andY:y1];
                    
                    spanLeft = YES;
                }
                else if(spanLeft && x > 0 && color != ocolor)
                {
                    spanLeft = NO;
                }
                
                byteIndex = (bytesPerRow * y1) + (x + 1) * bytesPerPixel;
                
                color = [self colorCodeAtIndex:byteIndex forimage:imageData];
                
                if(!spanRight && x < width - 1 && color == ocolor)
                {
                    [points pushFrontX:(x + 1) andY:y1];
                    
                    spanRight = YES;
                }
                else if(spanRight && x < width - 1 && color != ocolor)
                {
                    spanRight = NO;
                }
                
                y1++;
                
                byteIndex = (bytesPerRow * y1) + (x) * bytesPerPixel;
                
                color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            }
        }
        
        UIImage *result = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
        
        CGContextRelease(context);
        free(imageData);
        
        return result;
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception : %@", exception);
    }
}

- (unsigned int) colorCodeAtIndex:(unsigned int)byteIndex forimage:(unsigned char*)imageData
{
    unsigned int red   = imageData[byteIndex];
    unsigned int green = imageData[byteIndex + 1];
    unsigned int blue  = imageData[byteIndex + 2];
    unsigned int alpha = imageData[byteIndex + 3];
    
    return (red << 24) | (green << 16) | (blue << 8) | alpha;
}
- (unsigned int) colorCodeForColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
   
    unsigned int red   = components[0] * 255;
    unsigned int green = components[1] * 255;
    unsigned int blue  = components[2] * 255;
    unsigned int alpha = 255;
    
    unsigned int finalcolour = (red << 24) | (green << 16) | (blue << 8) | alpha;
    
    return finalcolour;
}

- (unsigned int) colorCodeForRed:(unsigned int)red green:(unsigned int)green blue:(unsigned int)blue alpha:(unsigned int)alpha;
{
    unsigned int finalcolour = (red << 24) | (green << 16) | (blue << 8) | alpha;
    
    return finalcolour;
}
@end
