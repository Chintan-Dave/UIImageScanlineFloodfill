//
//  UIImage+FloodFill.m
//  ImageFloodFilleDemo
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//



#import "UIImage+FloodFill.h"

@implementation UIImage (FloodFill)

- (UIImage *) floodFillFromPoint:(CGPoint)startPoint withColor:(UIColor *)newColor andTolerance:(int)tolerance;
{
    @try
    {
        /*
            First We create rowData from UIImage.
            We require this conversation so that we can use detail at pixel like color at pixel.
            You can get some discussion about this topic here:
            http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics
        */
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGImageRef imageRef = [self CGImage];
        
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
        
        //Get color at start point
        unsigned int byteIndex = (bytesPerRow * startPoint.y) + startPoint.x * bytesPerPixel;
        
        unsigned int ocolor = [self colorCodeAtIndex:byteIndex forimage:imageData];
        
        //Convert newColor to RGBA value so we can save it to image.
        const CGFloat *components = CGColorGetComponents(newColor.CGColor);
        
        int newRed   = components[0] * 255;
        int newGreen = components[1] * 255;
        int newBlue  = components[2] * 255;
        int newAlpha = 255;
    
        /*
            We are using stack to store point.
            Stack is implemented by LinkList.
            To incress speed I have used NSMutableData insted of NSMutableArray.
            To see Detail Of This implementation visit following leink.
            http://iwantmyreal.name/blog/2012/09/29/a-faster-array-in-objective-c/
        */
        
        LinkedListStack *points = [[LinkedListStack alloc] initWithCapacity:500 incrementSize:500 andMultiplier:height];
        
        int x = startPoint.x;
        int y = startPoint.y;
        
        [points pushFrontX:x andY:y];
        
        /*
            This algorithem is prety simple though it llook odd in Objective C syntex.
            To get familer with this algorithm visit following link.
            http://lodev.org/cgtutor/floodfill.html
            You can read hole artical for knowledge. 
            If you are familer with flood fill than got to Scanline Floodfill Algorithm With Stack (floodFillScanlineStack)
        */
        
        int y1;
        unsigned int color;
        BOOL spanLeft,spanRight;
        
        while ([points popFront:&x andY:&y] != INVALID_NODE_CONTENT)
        {
            y1 = y;
            
            byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
            
            color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            
            while(y1 >= 0 && color == ocolor)
            {
                y1--;
                
                byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
        
                color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            }
            
            y1++;
        
            spanLeft  = NO;
            spanRight = NO;
            
            byteIndex = (bytesPerRow * y1) + x * bytesPerPixel;
            
            color = [self colorCodeAtIndex:byteIndex forimage:imageData];
            
            while (y1 < height && color == ocolor)
            {
                imageData[byteIndex + 0] = newRed;
                imageData[byteIndex + 1] = newGreen;
                imageData[byteIndex + 2] = newBlue;
                imageData[byteIndex + 3] = newAlpha;
                
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
        
        //Convert Flood filled image row data back to UIImage object.
        
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

/*
    This function extract color from image and convert it to integer represent.
    Converting to integer make comperation easy.
*/
- (unsigned int) colorCodeAtIndex:(unsigned int)byteIndex forimage:(unsigned char*)imageData
{
    unsigned int red   = imageData[byteIndex];
    unsigned int green = imageData[byteIndex + 1];
    unsigned int blue  = imageData[byteIndex + 2];
    unsigned int alpha = imageData[byteIndex + 3];
    
    return (red << 24) | (green << 16) | (blue << 8) | alpha;
}

@end
